import 'package:flutter/material.dart';

class ControllerButton extends StatelessWidget {
  final IconData icon;
  final Function() onTap;

  const ControllerButton({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
