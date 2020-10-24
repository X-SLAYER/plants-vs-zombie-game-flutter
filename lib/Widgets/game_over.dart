import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameOver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Game Over",
              style:
                  GoogleFonts.pressStart2p(fontSize: 35.0, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            FlatButton(
              color: Colors.red,
              child: Text(
                "Play Again",
                style: GoogleFonts.pressStart2p(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: null,
            )
          ],
        ),
        color: Colors.black.withOpacity(0.6),
      ),
    );
  }
}
