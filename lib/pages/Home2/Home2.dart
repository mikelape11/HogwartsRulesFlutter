import 'package:flutter/material.dart';
import 'package:hogwarts_rules/pages/Ajustes/Ajustes.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Home2/Informacion2/Home2Portada.dart';
import 'package:hogwarts_rules/pages/Home2/Informacion2/Home2General.dart';
import 'package:hogwarts_rules/pages/Home2/SobreNosotros2/Home2SobreNosotros.dart';
import 'package:hogwarts_rules/pages/Home2/SobreNosotros2/Home2SobreNosotrosGeneral.dart';
import 'package:hogwarts_rules/pages/Home2/Tienda2/Tienda2.dart';
import 'package:hogwarts_rules/pages/Home2/Tienda2/Tienda2General.dart';
import 'package:hogwarts_rules/pages/Portada/Portada.dart';

import '../Portada/Login.dart';

class Home2 extends StatefulWidget {
  const Home2({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home2> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),   
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Color(globals.color2), width: 2.0)),      
        ),
        child: BottomNavigationBar( //LAS OPCIONES DEL BOTTOMNAVIGATIONBAR
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'SHOP',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'ABOUT US',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(globals.color2),
          unselectedItemColor: Colors.grey[700],
          onTap: _onItemTapped,
          backgroundColor: Color(globals.color1),
        ),
      )
    );
  }

  List<Widget> _widgetOptions = <Widget>[
    Tienda2General(),
    Home2General(),
    Home2SobreNosotrosGeneral()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}