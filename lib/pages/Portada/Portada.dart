import 'package:flutter/material.dart';

class Portada extends StatefulWidget {
  Portada({Key key}) : super(key: key);

  @override
  _PortadaState createState() => _PortadaState();
}

class _PortadaState extends State<Portada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
              image: DecorationImage(
                image:  AssetImage('images/Gryffindor/gryffindor2.png'),
                fit: BoxFit.cover, 
              )
            ),
      )
    
    );
  }
}