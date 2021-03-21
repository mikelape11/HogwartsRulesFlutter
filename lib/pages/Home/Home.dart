import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:hogwarts_rules/pages/Home/HomePersonajes/Gryffindor/HomeGryffindor.dart';
import 'package:hogwarts_rules/pages/Home/HomePortada/HomePortada.dart';
import 'package:hogwarts_rules/pages/Home/HomeSeleccion/HomeSeleccion.dart';
import 'package:hogwarts_rules/pages/Portada/Inicio.dart';

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
        automaticallyImplyLeading: false,
        title: Text('Home', style: TextStyle(color: Colors.yellow[800]),),
        backgroundColor: HexColor('#401617'),
        actions: [        
          IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(Icons.settings_outlined, color: Colors.orange, size: 25,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Inicio(),
              ));
            }
          ),
        ],
        bottom: PreferredSize(
        child: Container(
          color: Colors.orange,
          height: 2.0,
        ),
        
        preferredSize: Size.fromHeight(4.0)),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // body: Stack(
      //   children: [
      //     Container(
      //       decoration: BoxDecoration(
      //         // color: Colors.black87,
      //         image: DecorationImage(
      //           image:  AssetImage('images/Gryffindor/gryffindor.png'),
      //           fit: BoxFit.fitWidth,  
      //         ),
      //       ),
      //       width: MediaQuery.of(context).size.width,
      //       height: MediaQuery.of(context).size.height,
      //     ),
      //     SingleChildScrollView(
      //       scrollDirection: Axis.vertical,
      //       child: Column(
      //         children: [
      //           HomePortada(),
      //           HomeSeleccion(),
      //           HomeGryffindor(),
      //         ],
      //       ),   
      //     ),
      //   ],   
      // ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.orange, width: 2.0)),      
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
          selectedItemColor: Colors.orange,
          onTap: _onItemTapped,
          backgroundColor: HexColor('#401617'),
        ),
      )
    );
  }

  

  List<Widget> _widgetOptions = <Widget>[
    Container(child: Text('puta1'),),
    Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            // color: Colors.black87,
            image: DecorationImage(
              image:  AssetImage('images/Gryffindor/gryffindor.png'),
              fit: BoxFit.fitWidth,  
            ),
          ),
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          width: 440,
          height: 610,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              HomePortada(),
              HomeSeleccion(),
              HomeGryffindor(),
            ],
          ),   
        ),
      ],   
    ),
    Container(child: Text('puta3'),),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}