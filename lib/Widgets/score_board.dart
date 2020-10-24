import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants_vs_zombie/Constant/assets.dart';

class ScoreBoard extends StatelessWidget {
  final int score;

  const ScoreBoard({this.score});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Image.asset(Assets.zombieHead),
          width: 50.0,
          height: 50.0,
        ),
        SizedBox(width: 3.0),
        Text(
          "X",
          style: GoogleFonts.pressStart2p(fontSize: 20.0, color: Colors.white),
        ),
        SizedBox(width: 5.0),
        Text(
          score?.toString() ?? "0",
          style: GoogleFonts.pressStart2p(fontSize: 25.0, color: Colors.white),
        ),
      ],
    );
  }
}
