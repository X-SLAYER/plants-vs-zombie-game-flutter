import 'package:flutter/material.dart';
import 'package:plants_vs_zombie/Constant/assets.dart';

class Plant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(Assets.plantMock),
      width: 50.0,
      height: 50.0,
    );
  }
}
