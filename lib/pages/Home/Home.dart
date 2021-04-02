import 'package:flutter/material.dart';
import 'package:hogwarts_rules/pages/Ajustes2/Ajustes2.dart';
import 'package:hogwarts_rules/pages/Home/HomeInfo/HomeInfo.dart';
import 'package:hogwarts_rules/pages/Home/HomePersonajes/HomePersonajes.dart';
import 'package:hogwarts_rules/pages/Home/HomePortada/HomePortada.dart';
import 'package:hogwarts_rules/pages/Home/HomeSeleccion/HomeSeleccion.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Portada/Login.dart';
import 'package:hogwarts_rules/pages/Portada/Portada.dart';

import '../Portada/Login.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 22.0, 
                  backgroundColor: Color(globals.color2),            
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundColor: globals.gryPrincipal,
                    backgroundImage: AssetImage("images/LOGOS/LogoPeque.png"),
                    // backgroundImage: globals.existeAvatar
                    // ? AssetImage("images/perfil.png") 
                    // : FileImage(File(globals.avatar))
                  )            
                ),
              ],
            )
          ),
        ),
        title: Text('Home', style: TextStyle(color: globals.grySecundario),),
        backgroundColor: globals.gryPrincipal,
        centerTitle: true,
        actions: [        
          IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(Icons.settings_outlined, color: globals.grySecundario, size: 25,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Ajustes2(),
              ));
            }
          ),
        ],
        bottom: PreferredSize(
        child: Container(
          color: globals.grySecundario,
          height: 2.0,
        ),
        
        preferredSize: Size.fromHeight(4.0)),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),   
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: globals.grySecundario, width: 2.0)),      
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
              icon: Icon(Icons.chat),
              label: 'CHAT',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: globals.grySecundario,
          onTap: _onItemTapped,
          backgroundColor: globals.gryPrincipal,
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
              image:  AssetImage('${globals.fondoGry}'),
              fit: BoxFit.fitWidth,  
            ),
          ),
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          width: 450,
          height: 620,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              
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
              image:  AssetImage('${globals.fondoGry}'),
              fit: BoxFit.fitWidth,  
            ),
          ),
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          width: 450,
          height: 620,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              HomePortada(),
              HomeSeleccion(),
              HomePersonajes(),
              HomeInfo(),
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
              image:  AssetImage('${globals.fondoGry}'),
              fit: BoxFit.fitWidth,  
            ),
          ),
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          width: 450,
          height: 620,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              
            ],
          ),   
        ),
      ],   
    ),  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}