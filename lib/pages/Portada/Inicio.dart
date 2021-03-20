import 'package:flutter/material.dart';
import 'package:hogwarts_rules/pages/Login/Login.dart';
import 'package:hogwarts_rules/pages/Portada/Portada.dart';
import 'package:hogwarts_rules/pages/Registro/Registro.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  PageController controladorPageView;
  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: PageController(initialPage: 1),
        scrollDirection: Axis.horizontal,
        children: [
          Login(),
          Portada(),
          Registro(),
        ],
      ),
    );
  }
}