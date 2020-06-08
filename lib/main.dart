import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:epiflipboard/back/firebase/is_it_logged.dart';
import 'package:epiflipboard/back/firebase/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EPIFLIPBOARD',
      theme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new IsItLogged(auth: new Auth()),
    );
  }
}
