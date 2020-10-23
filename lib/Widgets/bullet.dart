import 'package:flutter/material.dart';
import 'package:plants_vs_zombie/Constant/assets.dart';

class Bullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(Assets.bulletMock),
      width: 20.0,
      height: 20.0,
    );
  }
}
