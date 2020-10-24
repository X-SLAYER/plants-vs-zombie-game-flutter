import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants_vs_zombie/Constant/assets.dart';
import 'package:plants_vs_zombie/Utils/audio_player.dart';
import 'package:plants_vs_zombie/routes.dart';

class GameOver extends StatelessWidget {
  _playSound() async {
    await AudioPlayer.playSound(Assets.game_over);
  }

  @override
  Widget build(BuildContext context) {
    final int score = ModalRoute.of(context).settings.arguments as int;
    _playSound();

    return Material(
      child: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Game Over",
                style: GoogleFonts.pressStart2p(
                    fontSize: 35.0, color: Colors.white),
              ),
              SizedBox(height: 25.0),
              Text(
                "Score: ${score ?? 0}",
                style: GoogleFonts.pressStart2p(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 25.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: FlatButton(
                  color: Colors.red,
                  child: Text(
                    "Play Again",
                    style: GoogleFonts.pressStart2p(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.home, (route) => false);
                  },
                ),
              ),
            ],
          ),
          color: Colors.black.withOpacity(0.6),
        ),
      ),
    );
  }
}
