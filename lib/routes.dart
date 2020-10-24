import 'package:flutter/material.dart';
import 'package:plants_vs_zombie/Screens/home_page.dart';
import 'Screens/game_over.dart';

class Routes {
  Routes._();

  static const String game_over = '/game-over';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => HomePage(),
    game_over: (BuildContext context) => GameOver(),
  };
}
