import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_rules/pages/Ajustes2/Ajustes2.dart';
import 'package:hogwarts_rules/pages/Home/Chat/ChatGeneral.dart';
import 'package:hogwarts_rules/pages/Home/Games/GamesGeneral.dart';
import 'package:hogwarts_rules/pages/Home/Informacion/HomeGeneral.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Home/Rules/RulesGeneral.dart';
import 'package:hogwarts_rules/pages/Home/Tienda/TiendaDetalles.dart';
import 'package:hogwarts_rules/pages/Home/Tienda/TiendaGeneral.dart';


import '../Portada/Login.dart';
import 'Informacion/HomeSeleccion.dart';

class Home extends StatefulWidget {
  int index;
  Home(this.index);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 2;
  int tienda = 0;
  int tienda2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(widget.index != 2 ? widget.index : _selectedIndex),
      ),   
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario , width: 2.0)),      
        ),
        child: BottomNavigationBar( //LAS OPCIONES DEL BOTTOMNAVIGATIONBAR
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'SHOP',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bolt_fill),
              label: 'RULES',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'CHAT',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.game_controller_solid),
              label: 'GAMES',
            ),
          ],
          currentIndex: widget.index != 2 ? widget.index : _selectedIndex,
          selectedItemColor: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
          unselectedItemColor: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario .withAlpha(125),
          onTap: _onItemTapped,
          backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
          type: BottomNavigationBarType.fixed,
        ),
      )
    );
  }

  List<Widget> _widgetOptions = <Widget>[
    TiendaGeneral(),
    RulesGeneral(),
    HomeGeneral(),
    ChatGeneral(),
    GamesGeneral(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.index = index;
    });
  }
}