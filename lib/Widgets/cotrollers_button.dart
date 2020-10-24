import 'package:flutter/material.dart';

class ControllerButton extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  static bool _isTapping = false;

  const ControllerButton({this.icon, this.onTap});

  bool isTapping() => _isTapping;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onTapUp: (details) {
        _isTapping = false;
      },
      onTapDown: (details) {
        _isTapping = true;
        onTap();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(10.0),
          color: Colors.brown[300],
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}
