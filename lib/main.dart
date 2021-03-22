import 'package:flutter/material.dart';
import 'package:hogwarts_rules/pages/Portada/Inicio.dart';

import 'pages/Home/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

