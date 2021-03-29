import 'package:flutter/material.dart';
import 'package:hogwarts_rules/pages/Home2/Home2.dart';
import 'package:hogwarts_rules/pages/Home2/Home2Portada/Home2Portada.dart';
import 'package:hogwarts_rules/pages/Test/PortadaTest.dart';
import 'package:hogwarts_rules/pages/Test/Test.dart';

import 'pages/Home/Home.dart';
import 'pages/Portada/Login.dart';
import 'pages/Portada/Portada.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Portada(),
    );
  }
}

