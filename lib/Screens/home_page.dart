import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plants_vs_zombie/Constant/assets.dart';
import 'package:plants_vs_zombie/Models/bullet.dart';
import 'package:plants_vs_zombie/Models/main_handler.dart';
import 'package:plants_vs_zombie/Models/plant.dart';
import 'package:plants_vs_zombie/Models/zombie.dart';
import 'package:plants_vs_zombie/Utils.dart/audio_player.dart';
import 'package:plants_vs_zombie/Utils.dart/math_util.dart';
import 'package:plants_vs_zombie/Widgets/bullet.dart';
import 'package:plants_vs_zombie/Widgets/cotrollers_button.dart';
import 'package:plants_vs_zombie/Widgets/plant.dart';
import 'package:plants_vs_zombie/Widgets/zombie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PlantHandler _plant = PlantHandler(-0.90, 0.2);
  Bullethandler _bullet = Bullethandler(5, 5);
  ZombieHandler _zombie = ZombieHandler(1.1, 1);
  Timer _zombieTimer, _bulletTimer;

  _moveUp(MainHandler mock) {
    setState(() {
      mock.moveUp(-0.05);
    });
  }

  _moveDown(MainHandler mock) {
    setState(() {
      mock.moveDown(0.05);
    });
  }

  _shootBullet() async {
    if (_bullet.x == 5) {
      await AudioPlayer.playSound();
      setState(() {
        _bullet.initCords(_plant.x + 0.1, _plant.y - 0.11);
      });
      _bulletTimer = Timer.periodic(Duration(milliseconds: 30), (timer) {
        setState(() {
          _bullet.moveRight();
        });
        if ((_bullet.x - _zombie.x).abs() < 0.05 &&
            (_bullet.y - _zombie.y).abs() < 0.05) {
          timer.cancel();
          _zombieTimer.cancel();
          _bullet.initCords(5, 5);
          _moveZombie();
        }
        if (_bullet.x > 1.3) {
          timer.cancel();
          _bullet.initCords(5, 5);
        }
      });
    }
  }

  _moveZombie() {
    setState(() {
      _zombie.initCords(1.1, nexRandom(-0.9, 0.9));
    });
    if (_zombie.x == 1.1) {
      _zombieTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        setState(() {
          _zombie.moveLeft();
        });
        if ((_plant.x - _zombie.x).abs() < 0.05) {
          timer.cancel();
          _bulletTimer.cancel();
          print("Game Over");
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _moveZombie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _garden(),
          _gameControllers(),
        ],
      ),
    );
  }

  /// Game controllers arrows & shoot button
  Widget _gameControllers() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.brown[600],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                ControllerButton(
                    icon: Icons.arrow_upward,
                    onTap: () {
                      _moveUp(_plant);
                    }),
                SizedBox(width: 15.0),
                ControllerButton(
                  icon: Icons.arrow_downward,
                  onTap: () {
                    _moveDown(_plant);
                  },
                ),
              ],
            ),
            ControllerButton(
              icon: Icons.play_arrow,
              onTap: _moveZombie,
            ),
            ControllerButton(
              icon: Icons.fire_extinguisher,
              onTap: _shootBullet,
            ),
          ],
        ),
      ),
    );
  }

  /// the main garden
  _garden() {
    return Expanded(
      flex: 5,
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.garden),
              fit: BoxFit.cover,
            ),
          ),
          child: _players()),
    );
  }

  /// Plants , Zombies & bullet will be displayed
  Widget _players() {
    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 0),
          alignment: Alignment(_plant.x, _plant.y),
          child: Plant(),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 0),
          alignment: Alignment(_bullet.x, _bullet.y),
          child: Bullet(),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 0),
          alignment: Alignment(_zombie.x, _zombie.y),
          child: Zombie(),
        ),
      ],
    );
  }
}
