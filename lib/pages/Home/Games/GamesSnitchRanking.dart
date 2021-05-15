import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Home/Games/RankingAPI.dart';

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
                  icon: Icon(Icons.arrow_back, color: globals.casaHogwarts == "Gryffindor" ? globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 25,),
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
                  ? globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario
                  : globals.casaHogwarts == "Slytherin"
                      ? globals.slySecundario
                      : globals.casaHogwarts == "Ravenclaw"
                          ? globals.ravSecundario
                          : globals.casaHogwarts == "Hufflepuff"
                              ? globals.hufSecundario
                              : globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),
        ),
        backgroundColor: globals.casaHogwarts == "Gryffindor"
            ? globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal
            : globals.casaHogwarts == "Slytherin"
                ? globals.slyPrincipal
                : globals.casaHogwarts == "Ravenclaw"
                    ? globals.ravPrincipal
                    : globals.casaHogwarts == "Hufflepuff"
                        ? globals.hufPrincipal
                        : globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
        centerTitle: true,
        bottom: PreferredSize(
            child: Container(
              color: globals.casaHogwarts == "Gryffindor"
                  ? globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario
                  : globals.casaHogwarts == "Slytherin"
                      ? globals.slySecundario
                      : globals.casaHogwarts == "Ravenclaw"
                          ? globals.ravSecundario
                          : globals.casaHogwarts == "Hufflepuff"
                              ? globals.hufSecundario
                              : globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
              height: 2.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: globals.casaHogwarts == "Gryffindor" ? globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,           
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          FutureBuilder(
            future: getRankingPorCasa(globals.casaHogwarts),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(!snapshot.hasData){    
                return Center(child: Text(""));
              }else{ 
                return Column(
                    children: <Widget>[ 
                      Container(
                        decoration: BoxDecoration(
                          color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
                          boxShadow: [
                            BoxShadow(
                              color: globals.casaHogwarts == "Gryffindor" ? Colors.black87 : globals.casaHogwarts == "Slytherin" ? Colors.black87 : globals.casaHogwarts == "Ravenclaw" ? Colors.black87 : globals.casaHogwarts == "Hufflepuff" ? Colors.white24 : globals.gryPrincipal.withRed(125),
                              spreadRadius: 4,
                              blurRadius: 5,
                              offset: Offset(0,5),
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
                                              color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,                                     
                                            ), 
                                          ),
                                        ),
                                        Container( //FOTO PRIMERA POSICION
                                          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 130),
                                          child:  GestureDetector(
                                            child: CircleAvatar(
                                              radius: 65,
                                              backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
                                              child: CircleAvatar(
                                                radius:  60,
                                                backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
                                                backgroundImage: AssetImage(snapshot.data[0].avatar) 
                                              )            
                                            ),
                                          ),
                                        ),
                                        Container( //NOMBRE PRIMERA POSICION
                                          width: 120,
                                          alignment: Alignment.center,
                                          child: Column(
                                            children: [
                                              Text(
                                                '${snapshot.data[0].usuario}',
                                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: snapshot.data[0].usuario == globals.usuario ? Colors.red [900] : Colors.white70),
                                              ),
                                              Text(
                                                '${snapshot.data[0].puntos}',
                                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white70),
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
                                              color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,                                     
                                            ), 
                                          ),
                                        ),
                                        Container( //FOTO SEGUNDA POSICION
                                          margin: EdgeInsets.only(left: 20, top: 15),
                                          child: GestureDetector(
                                            child: CircleAvatar(
                                              radius: 50.0,
                                              backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
                                              child: CircleAvatar(
                                                radius: 46.0,
                                                backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
                                                backgroundImage: AssetImage(snapshot.data[1].avatar)
                                              )            
                                            ),
                                          ),
                                        ),
                                        Container( //NOMBRE SEGUNDA POSICION                                     
                                          margin: EdgeInsets.only(top: 15, left: 25),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${snapshot.data[1].usuario}',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: snapshot.data[1].usuario == globals.usuario ? Colors.red [900] : Colors.white70),                                               
                                              ),
                                              Text(
                                                '${snapshot.data[1].puntos}',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white70),
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
                                              color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,                                     
                                            ), 
                                          ),
                                        ),
                                        Container( //FOTO TERCERA POSICION
                                          margin: EdgeInsets.only(left: 270, top: 15),
                                          child: GestureDetector(
                                            child: CircleAvatar(
                                              radius: 50.0,
                                              backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
                                              child: CircleAvatar(
                                                radius: 46.0,
                                                backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
                                                backgroundImage: AssetImage(snapshot.data[2].avatar)
                                              )            
                                            ),
                                          ),
                                        ), 
                                        Container( //NOMBRE TERCERA POSICION
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(top: 15, left: 270),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${snapshot.data[2].usuario}',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: snapshot.data[2].usuario == globals.usuario ? Colors.red [900] : Colors.white70),
                                              ),
                                              Text(
                                                '${snapshot.data[2].puntos}',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white70),
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
                        height: 340,
                        margin: EdgeInsets.only(top: 15), 
                        child: DraggableScrollableSheet(
                          initialChildSize: 1,
                          builder: (context, scrollController){
                            return SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  for(int n=3; n<snapshot.data.length;n++)//HACE FALTA HACER UN FOR PARA TODOS LOS JUGADORES
                                  GestureDetector(                       
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                      child: Card(
                                        color: globals.casaHogwarts == "Gryffindor" ? globals.gryTerciario : globals.casaHogwarts == "Slytherin" ? globals.slyTerciario : globals.casaHogwarts == "Ravenclaw" ? globals.ravTerciario : globals.casaHogwarts == "Hufflepuff" ? globals.hufTerciario : globals.gryTerciario,           
                                        elevation: 30,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 10), //CONTAINER PARA LOS DATOS DEL JUGADOR,
                                          width: MediaQuery.of(context).size.width,
                                          child: Row( //CREO UNA FILA PARA MOSTRARLOS
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container( //NUMERO POSICION
                                                width: 40,
                                                height: 40,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${n+1}', 
                                                  style: TextStyle(
                                                    fontFamily: 'arial',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22.0,
                                                    color: globals.casaHogwarts == "Gryffindor" ? Colors.black87 : globals.casaHogwarts == "Slytherin" ? Colors.black87 : globals.casaHogwarts == "Ravenclaw" ? Colors.black87 : globals.casaHogwarts == "Hufflepuff" ? Colors.white70 : globals.gryPrincipal,
                                                  )
                                                )
                                              ),
                                              Container( //FOTO 
                                                margin: EdgeInsets.only(left: 14),
                                                width: 70,
                                                height: 40,
                                                child: CircleAvatar(
                                                  radius: 20.0,
                                                  backgroundColor: globals.casaHogwarts == "Gryffindor" ? Colors.black87 : globals.casaHogwarts == "Slytherin" ? Colors.black87 : globals.casaHogwarts == "Ravenclaw" ? Colors.black87 : globals.casaHogwarts == "Hufflepuff" ? Colors.white70 : globals.gryPrincipal,
                                                  child: CircleAvatar(
                                                    radius: 17.0,
                                                    backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
                                                    backgroundImage: AssetImage(snapshot.data[n].avatar)
                                                  )            
                                                ),
                                              ),
                                              Container( //NOMBRE DEL USUARIO
                                                margin: EdgeInsets.only(left: 13),
                                                width: 132,
                                                height: 40,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${snapshot.data[n].usuario}', 
                                                  style: TextStyle(
                                                    fontFamily: 'arial',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                    color: snapshot.data[n].usuario == globals.usuario ? Colors.red [900] : globals.casaHogwarts == "Gryffindor" ? Colors.black87 : globals.casaHogwarts == "Slytherin" ? Colors.black87 : globals.casaHogwarts == "Ravenclaw" ? Colors.black87 : globals.casaHogwarts == "Hufflepuff" ? Colors.white70 : globals.gryPrincipal,                                                )
                                                )
                                              ),
                                              Container( //PUNTUACION
                                                margin: EdgeInsets.only(left: 15),
                                                width: 50,
                                                height: 40, 
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${snapshot.data[n].puntos}', 
                                                  style: TextStyle(
                                                    fontFamily: 'arial',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                    color: globals.casaHogwarts == "Gryffindor" ? Colors.black87 : globals.casaHogwarts == "Slytherin" ? Colors.black87 : globals.casaHogwarts == "Ravenclaw" ? Colors.black87 : globals.casaHogwarts == "Hufflepuff" ? Colors.white70 : globals.gryPrincipal,                                                )
                                                )
                                              ),
                                            ]
                                          ),
                                        ),
                                      )
                                    ),
                                  ), 
                                ],                              
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                  }
                }
          )
        ],
      ),
    );
  }
}