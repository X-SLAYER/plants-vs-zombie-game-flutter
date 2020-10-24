import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plants_vs_zombie/Screens/home_page.dart';
import 'package:plants_vs_zombie/routes.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plants vs Zombie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: Routes.routes,
    );
  }
}
