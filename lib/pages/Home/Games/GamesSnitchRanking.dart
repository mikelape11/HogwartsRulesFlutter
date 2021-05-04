import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;

import '../Home.dart';

class GamesSnitchRanking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Stack(
              children: <Widget>[
                IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                  icon: Icon(Icons.arrow_back, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 25,),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Home(4),
                    ));
                  }
                ),
              ],
            )
          ),
        ),
        title: Text(
          'CLASIFICACIÓN',
          style: TextStyle(
              color: globals.casaHogwarts == "Gryffindor"
                  ? globals.grySecundario
                  : globals.casaHogwarts == "Slytherin"
                      ? globals.slySecundario
                      : globals.casaHogwarts == "Ravenclaw"
                          ? globals.ravSecundario
                          : globals.casaHogwarts == "Hufflepuff"
                              ? globals.hufSecundario
                              : globals.grySecundario),
        ),
        backgroundColor: globals.casaHogwarts == "Gryffindor"
            ? globals.gryPrincipal
            : globals.casaHogwarts == "Slytherin"
                ? globals.slyPrincipal
                : globals.casaHogwarts == "Ravenclaw"
                    ? globals.ravPrincipal
                    : globals.casaHogwarts == "Hufflepuff"
                        ? globals.hufPrincipal
                        : globals.gryPrincipal,
        centerTitle: true,
        bottom: PreferredSize(
            child: Container(
              color: globals.casaHogwarts == "Gryffindor"
                  ? globals.grySecundario
                  : globals.casaHogwarts == "Slytherin"
                      ? globals.slySecundario
                      : globals.casaHogwarts == "Ravenclaw"
                          ? globals.ravSecundario
                          : globals.casaHogwarts == "Hufflepuff"
                              ? globals.hufSecundario
                              : globals.grySecundario,
              height: 2.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
              // image: DecorationImage(
              //   image: globals.casaHogwarts == "Gryffindor"
              //       ? AssetImage('${globals.fondoGry}')
              //       : globals.casaHogwarts == "Slytherin"
              //           ? AssetImage('${globals.fondoSly}')
              //           : globals.casaHogwarts == "Ravenclaw"
              //               ? AssetImage('${globals.fondoRav}')
              //               : globals.casaHogwarts == "Hufflepuff"
              //                   ? AssetImage('${globals.fondoHuf}')
              //                   : AssetImage('${globals.fondoGry}'),
              //   fit: BoxFit.fitWidth,
              // ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
                  children: <Widget>[ 
                    Container(
                      decoration: BoxDecoration(
                        color: globals.gryPrincipal,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
                        boxShadow: [
                          BoxShadow(
                            color: globals.gryPrincipal.withRed(125),
                            spreadRadius: 3,
                            blurRadius: 2,
                            offset: Offset(0,2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(top: 15, bottom: 10),
                      child: Column(
                        children: [
                          // Text( //TEXTO DEL TITULO DE LA PANTALLA
                          //   'CLASIFICACIÓN',
                          //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          // ),
                          Container( //CONTAINER DEL PODIO
                            padding: EdgeInsets.only(bottom: 5),
                            margin: EdgeInsets.only(top: 0),
                            child: Row( //LAS 3 POSICIONES IRAN EN UNA FILA
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Stack( //PARA PODER COLOCAR LOS CONTAINERS DENTRO DE LA FILA
                                children: [
                                  Column(
                                    children: [
                                      Container( //ESTRELLA 1
                                        margin: EdgeInsets.symmetric(horizontal: 157),
                                        child: Text(
                                          '1', 
                                          style: TextStyle(
                                            fontFamily: 'arial',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 34.0,
                                            color: globals.grySecundario,                                     
                                          ), 
                                        ),
                                      ),
                                      Container( //FOTO PRIMERA POSICION
                                        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 130),
                                        child:  GestureDetector(
                                          child: CircleAvatar(
                                            radius: 65,
                                            backgroundColor: globals.grySecundario,
                                            child: CircleAvatar(
                                              radius:  60,
                                              backgroundColor: globals.gryPrincipal,
                                              // backgroundImage: fotos[0] == "images/perfil.png"
                                                // ? AssetImage("images/perfil.png") 
                                                // : FileImage(File(fotos[0]))
                                            )            
                                          ),
                                        ),
                                      ),
                                      Container( //NOMBRE PRIMERA POSICION
                                        width: 120,
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                                GestureDetector(
                                                
                                                  child: Text(
                                                    'CCCCC',
                                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                Text(
                                                  '30',
                                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                ),
                                          ],
                                        ),
                                      ),      
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container( //ESTRELLA 2
                                        margin: EdgeInsets.only(left: 22, top: 70),
                                        child: Text(
                                          '2', 
                                          style: TextStyle(
                                            fontFamily: 'arial',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 34.0,
                                            color: globals.grySecundario,                                     
                                          ), 
                                        ),
                                      ),
                                      Container( //FOTO SEGUNDA POSICION
                                        margin: EdgeInsets.only(left: 20, top: 15),
                                        child: GestureDetector(
                                          child: CircleAvatar(
                                            radius: 50.0,
                                            backgroundColor: globals.grySecundario,
                                            child: CircleAvatar(
                                              radius: 46.0,
                                              backgroundColor: globals.gryPrincipal,
                                              // backgroundImage: fotos[1] == "images/perfil.png"
                                                // ? AssetImage("images/perfil.png") 
                                                // : FileImage(File(fotos[1]))
                                            )            
                                          ),
                                        ),
                                      ),
                                      Container( //NOMBRE SEGUNDA POSICION
                                        
                                        margin: EdgeInsets.only(top: 20, left: 5),
                                        child: Column(
                                          children: [
                                                GestureDetector(                                        
                                                  child: Text(
                                                    'AAAAA',
                                                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                                                    
                                                  ),
                                                ),
                                                Text(
                                                  '10',
                                                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                                                ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container( //ESTRELLA 3
                                        margin: EdgeInsets.only(left: 275, top: 70),
                                        child: Text(
                                          '3', 
                                          style: TextStyle(
                                            fontFamily: 'arial',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 34.0,
                                            color: globals.grySecundario,                                     
                                          ), 
                                        ),
                                      ),
                                      Container( //FOTO TERCERA POSICION
                                        margin: EdgeInsets.only(left: 270, top: 15),
                                        child: GestureDetector(
                                          child: CircleAvatar(
                                            radius: 50.0,
                                            backgroundColor: globals.grySecundario,
                                            child: CircleAvatar(
                                              radius: 46.0,
                                              backgroundColor: globals.gryPrincipal,
                                              // backgroundImage: fotos[2] == "images/perfil.png"
                                                // ? AssetImage("images/perfil.png") 
                                                // : FileImage(File(fotos[2]))
                                            )            
                                          ),
                                        ),
                                      ), 
                                      Container( //NOMBRE TERCERA POSICION
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(top: 20, left: 270),
                                        child: Column(
                                          children: [
                                            GestureDetector(                                        
                                              child: Text(
                                                'BBBBBBBB',
                                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                              '20',
                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),                                        
                                    ],
                                  ),       
                                ],
                              ), 
                            ])
                          ),
                        ],
                      )
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10), 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //for(int n=3; n<listaRankingPuntos.length;n++)//HACE FALTA HACER UN FOR PARA TODOS LOS JUGADORES
                          GestureDetector(                       
                            child: Container( //CONTAINER PARA LOS DATOS DEL JUGADOR
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(top: 10),
                              child: Row( //CREO UNA FILA PARA MOSTRARLOS
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container( //NUMERO POSICION
                                    width: 40,
                                    height: 40,
                                    color: globals.gryPrincipal,
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${4}', 
                                      style: TextStyle(
                                        fontFamily: 'arial',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                        //color: listaRankingNombres[n] == globals.usuario ? Colors.red [900] : Colors.grey[900],
                                      )
                                    )
                                  ),
                                  Container( //FOTO 
                                    margin: EdgeInsets.only(left: 14),
                                    width: 70,
                                    height: 40,
                                    child: CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: globals.gryPrincipal,
                                      child: CircleAvatar(
                                        radius: 17.0,
                                        backgroundColor: globals.grySecundario,
                                        // backgroundImage: fotos[n] == "images/perfil.png"
                                      // ? AssetImage("images/perfil.png") 
                                      // : FileImage(File(fotos[n]))
                                      )            
                                    ),
                                  ),
                                  Container( //NOMBRE DEL USUARIO
                                    margin: EdgeInsets.only(left: 13),
                                    width: 132,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'MIKEL', 
                                      style: TextStyle(
                                        fontFamily: 'arial',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        //color: listaRankingNombres[n] == globals.usuario ? Colors.red [900] : Theme.of(context).primaryColor == Colors.grey[900] ? Colors.white : Colors.black,
                                      )
                                    )
                                  ),
                                  Container( //PUNTUACION
                                    margin: EdgeInsets.only(left: 15),
                                    width: 50,
                                    height: 40, 
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${0}', 
                                      style: TextStyle(
                                        fontFamily: 'arial',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        //color: listaRankingNombres[n] == globals.usuario ? Colors.red [900] : Theme.of(context).primaryColor == Colors.grey[900] ? Colors.white : Colors.black,
                                      )
                                    )
                                  ),
                                ]
                              ),
                            ),
                          ), 
                        ],
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}