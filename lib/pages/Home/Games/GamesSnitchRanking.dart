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
          'Adivina quien eres',
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
              //color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
              image: DecorationImage(
                image: globals.casaHogwarts == "Gryffindor"
                    ? AssetImage('${globals.fondoGry}')
                    : globals.casaHogwarts == "Slytherin"
                        ? AssetImage('${globals.fondoSly}')
                        : globals.casaHogwarts == "Ravenclaw"
                            ? AssetImage('${globals.fondoRav}')
                            : globals.casaHogwarts == "Hufflepuff"
                                ? AssetImage('${globals.fondoHuf}')
                                : AssetImage('${globals.fondoGry}'),
                fit: BoxFit.fitWidth,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
                  children: <Widget>[ 
                    Divider(),
                    Text( //TEXTO DEL TITULO DE LA PANTALLA
                      'CLASIFICACIÓN',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    Container( //CONTAINER DEL PODIO
                      padding: EdgeInsets.only(bottom: 5),
                      margin: EdgeInsets.only(top: 0),
                      child: Row( //LAS 3 POSICIONES IRAN EN UNA FILA
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Stack( //PARA PODER COLOCAR LOS CONTAINERS DENTRO DE LA FILA
                          children: [
                            Container( //ESTRELLA 1
                              margin: EdgeInsets.symmetric(horizontal: 137),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amberAccent[400],
                                    size: 60.0,
                                  ),
                                  Text(
                                    '1', 
                                    style: TextStyle(
                                      fontFamily: 'arial',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0,
                                      color: Colors.grey[900],
                                    )
                                  )
                                ],
                              ),
                            ),
                            Container( //ESTRELLA 2
                              margin: EdgeInsets.only(left: 30, top: 70),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.blueGrey[300],
                                    size: 60.0,
                                  ),
                                  Text(
                                    '2', 
                                    style: TextStyle(
                                      fontFamily: 'arial',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0,
                                      color: Colors.grey[900],
                                    )
                                  )
                                ],
                              ),
                            ),
                            Container( //ESTRELLA 3
                              margin: EdgeInsets.only(left: 245, top: 80),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.brown,
                                    size: 60.0,
                                  ),
                                  Text(
                                    '3', 
                                    style: TextStyle(
                                      fontFamily: 'arial',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0,
                                      color: Colors.grey[900],
                                    )
                                  )
                                ],
                              ),
                            ),  
                            Container( //FOTO SEGUNDA POSICION
                              margin: EdgeInsets.only(left: 0, top: 110),
                              child: GestureDetector(
                                child: CircleAvatar(
                                  radius: 60.0,
                                  backgroundColor: Colors.blueGrey[300],
                                  child: CircleAvatar(
                                    radius: 56.0,
                                    // backgroundImage: fotos[1] == "images/perfil.png"
                                      // ? AssetImage("images/perfil.png") 
                                      // : FileImage(File(fotos[1]))
                                  )            
                                ),
                              ),
                            ),
                            Container( //FOTO TERCERA POSICION
                              margin: EdgeInsets.only(left: 214, top: 120),
                              child: GestureDetector(
                                child: CircleAvatar(
                                  radius: 60.0,
                                  backgroundColor: Colors.brown,
                                  child: CircleAvatar(
                                    radius: 56.0,
                                    // backgroundImage: fotos[2] == "images/perfil.png"
                                      // ? AssetImage("images/perfil.png") 
                                      // : FileImage(File(fotos[2]))
                                  )            
                                ),
                              ),
                            ),
                            Container( //FOTO PRIMERA POSICION
                              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 84),
                              child:  GestureDetector(
                                child: CircleAvatar(
                                  radius: 83,
                                  backgroundColor: Colors.amberAccent[400],
                                  child: CircleAvatar(
                                    radius:  79,
                                    // backgroundImage: fotos[0] == "images/perfil.png"
                                      // ? AssetImage("images/perfil.png") 
                                      // : FileImage(File(fotos[0]))
                                  )            
                                ),
                              ),
                            ),
                            Container( //NOMBRE SEGUNDA POSICION
                              color:  Colors.blueGrey[300],
                              padding: EdgeInsets.symmetric(vertical: 11),
                              width: 110,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 239, left: 5),
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
                            Container( //NOMBRE TERCERA POSICION
                              color: Colors.brown,
                              padding: EdgeInsets.symmetric(vertical: 7),
                              width: 110,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 249, left: 220),
                              child: Column(
                                children: [
                                      GestureDetector(
                                        
                                        child: Text(
                                          'BBBBBB',
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
                            
                            Container( //NOMBRE PRIMERA POSICION
                              color: Colors.amberAccent[400],
                              padding: EdgeInsets.symmetric(vertical: 20),
                              width: 120,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 219, left: 108),
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
                      ])
                    ),
                    Divider(),           
                    Container( //CONTENEDOR PARA LOS OTROS PUESTOS
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
                                    color: Colors.cyan,
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
                                      backgroundColor: Colors.cyan,
                                      child: CircleAvatar(
                                        radius: 19.0,
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