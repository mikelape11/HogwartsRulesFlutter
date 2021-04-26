import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;

class GamesSnitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario//change your color here
        ),
        title: Text('Atrapa la Snitch', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
        backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
        centerTitle: true,
        bottom: PreferredSize(
        child: Container(
          color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(4.0)),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              //color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
              image: DecorationImage(
                image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoHuf}') :  AssetImage('${globals.fondoGry}'),
                fit: BoxFit.fitWidth,  
                
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              decoration: BoxDecoration(
                color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withOpacity(0.9),
                border: Border.all(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, width: 2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 140,
              height: 50,
              child: Center(child: Text('T. RESTANTE: 60', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),)),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              
              width: 70,
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    //image: AssetImage('${widget.snapshot.data[i].avatar}'),
                    image: AssetImage("images/snitch.png"),
                    fit: BoxFit.fitWidth,  
                  ),
                ),
              ),
            ),
          ), 
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(top: 10, right: 10),
              decoration: BoxDecoration(
                color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withOpacity(0.9),
                border: Border.all(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, width: 2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 140,
              height: 50,
              child: Center(child: Text('PUNTUACIÓN: 0', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 80, left: 20, bottom: 20, right: 20),
            height: MediaQuery.of(context).size.height/1,
            color: globals.gryPrincipal,
          ), 
        ],                         
      ),
    );
  }
}