import 'package:flutter/material.dart';
import 'package:hogwarts_rules/pages/Home/HomeSeleccion/HomeSeleccion.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Home2/Home2Portada/Home2Portada.dart';
import 'package:hogwarts_rules/pages/Home2/Home2SobreNosotros/Home2SobreNosotros.dart';
import 'package:hogwarts_rules/pages/Portada/Portada.dart';

import '../Portada/Login.dart';

class Home2 extends StatefulWidget {
  const Home2({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home2> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home', style: TextStyle(color: Color(globals.color2)),),
        backgroundColor: Color(globals.color1),
        centerTitle: true,
        actions: [        
          IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(Icons.settings_outlined, color: Color(globals.color2), size: 25,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Portada(),
              ));
            }
          ),
        ],
        bottom: PreferredSize(
        child: Container(
          color: Color(globals.color2),
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(4.0)),
      ),
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
          onTap: _onItemTapped,
          backgroundColor: Color(globals.color1),
        ),
      )
    );
  }

  List<Widget> _widgetOptions = <Widget>[
    Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            // color: Colors.black87,
            image: DecorationImage(
              image:  AssetImage('${globals.fondoNegro3}'),
              fit: BoxFit.fitWidth,  
            ),
          ),
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          width: 450,
          height: 720,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text("shop")
            ],
          ),   
        ),
      ],   
    ),
    Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            // color: Colors.black87,
            image: DecorationImage(
              image:  AssetImage('${globals.fondoNegro3}'),
              fit: BoxFit.fitWidth,  
            ),
          ),
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          width: 450,
          height: 720,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Home2Portada(),
              //HomeSeleccion(),
            ],
          ),   
        ),
      ],   
    ),
    Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            // color: Colors.black87,
            image: DecorationImage(
              image:  AssetImage('${globals.fondoNegro3}'),
              fit: BoxFit.fitWidth,  
            ),
          ),
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          width: 450,
          height: 720,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Home2SobreNosotros()
            ],
          ),   
        ),
      ],   
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}