import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Ajustes/Ajustes.dart';
import 'package:hogwarts_rules/widgets/custom_alert_dialog.dart';

import '../Home.dart';

class GamesSnitch extends StatefulWidget {
  @override
  _GamesSnitchState createState() => _GamesSnitchState();
}

class _GamesSnitchState extends State<GamesSnitch> {
  Random random = new Random();
  Timer timer;
  Timer timer2;
  Timer timer3;
  var contador = 5;
  var top = 300.0;
  var left = 500.0;
  var puntuacion = 0;
  var velocidad = 500;

  changePosition() {
    setState(() {
      top = random.nextDouble() + random.nextInt(500) + 100;
      if (top > 500) {
        top = 500;
      }
      left = random.nextDouble() + random.nextInt(300);
    });
  }

  FutureOr changeSnitch() {
    setState(() {
      if (contador == 0) {
        timer.cancel();
        timer2.cancel();
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return CustomAlertDialog(
                titlePadding: EdgeInsets.all(0.0),
                contentPadding: EdgeInsets.all(0.0),
                content: Container(
                  decoration: BoxDecoration(
                      color: globals.casaHogwarts == "Gryffindor"
                          ? globals.gryPrincipal
                          : globals.casaHogwarts == "Slytherin"
                              ? globals.slyPrincipal
                              : globals.casaHogwarts == "Ravenclaw"
                                  ? globals.ravPrincipal
                                  : globals.casaHogwarts == "Hufflepuff"
                                      ? globals.hufPrincipal
                                      : globals.gryPrincipal.withOpacity(0.9),
                      border: Border.all(
                          color: globals.casaHogwarts == "Gryffindor"
                              ? globals.grySecundario
                              : globals.casaHogwarts == "Slytherin"
                                  ? globals.slySecundario
                                  : globals.casaHogwarts == "Ravenclaw"
                                      ? globals.ravSecundario
                                      : globals.casaHogwarts == "Hufflepuff"
                                          ? globals.hufSecundario
                                          : globals.grySecundario,
                          width: 3)),
                  width: 350,
                  height: 200,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 15),
                        Container(
                          child: Icon(
                            Icons.announcement_outlined,
                            color: Colors.red,
                            size: 50,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text("Se ha acabado el tiempo.",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: globals.casaHogwarts == "Gryffindor"
                                      ? globals.grySecundario
                                      : globals.casaHogwarts == "Slytherin"
                                          ? globals.slySecundario
                                          : globals.casaHogwarts == "Ravenclaw"
                                              ? globals.ravSecundario
                                              : globals.casaHogwarts ==
                                                      "Hufflepuff"
                                                  ? globals.hufSecundario
                                                  : globals.grySecundario)),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: RaisedButton(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            color: globals.casaHogwarts == "Gryffindor"
                                ? globals.gryPrincipal
                                : globals.casaHogwarts == "Slytherin"
                                    ? globals.slyPrincipal
                                    : globals.casaHogwarts == "Ravenclaw"
                                        ? globals.ravPrincipal
                                        : globals.casaHogwarts == "Hufflepuff"
                                            ? globals.hufPrincipal
                                            : globals.gryPrincipal,
                            child: Text(
                              'Aceptar',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Home(4),
                              ));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      } else {
        contador--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => changeSnitch());
    // if (puntuacion > 10) {
    //   timer2.cancel();
    //   timer3 = Timer.periodic(
    //       Duration(milliseconds: 10), (Timer t) => changePosition());
    // }
    timer2 = Timer.periodic(
        Duration(milliseconds: 400), (Timer t) => changePosition());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: globals.casaHogwarts == "Gryffindor"
                ? globals.grySecundario
                : globals.casaHogwarts == "Slytherin"
                    ? globals.slySecundario
                    : globals.casaHogwarts == "Ravenclaw"
                        ? globals.ravSecundario
                        : globals.casaHogwarts == "Hufflepuff"
                            ? globals.hufSecundario
                            : globals.grySecundario //change your color here
            ),
        title: Text(
          'Atrapa la Snitch',
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
        actions: [
          IconButton(
              //ICONO PARA IR AL PERFIL DE USUARIO
              icon: Icon(
                Icons.insert_chart_outlined,
                color: globals.casaHogwarts == "Gryffindor"
                    ? globals.grySecundario
                    : globals.casaHogwarts == "Slytherin"
                        ? globals.slySecundario
                        : globals.casaHogwarts == "Ravenclaw"
                            ? globals.ravSecundario
                            : globals.casaHogwarts == "Hufflepuff"
                                ? globals.hufSecundario
                                : globals.grySecundario,
                size: 25,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Ajustes(),
                ));
              }),
        ],
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
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              decoration: BoxDecoration(
                color: globals.casaHogwarts == "Gryffindor"
                    ? globals.gryPrincipal
                    : globals.casaHogwarts == "Slytherin"
                        ? globals.slyPrincipal
                        : globals.casaHogwarts == "Ravenclaw"
                            ? globals.ravPrincipal
                            : globals.casaHogwarts == "Hufflepuff"
                                ? globals.hufPrincipal
                                : globals.gryPrincipal.withOpacity(0.9),
                border: Border.all(
                    color: globals.casaHogwarts == "Gryffindor"
                        ? globals.grySecundario
                        : globals.casaHogwarts == "Slytherin"
                            ? globals.slySecundario
                            : globals.casaHogwarts == "Ravenclaw"
                                ? globals.ravSecundario
                                : globals.casaHogwarts == "Hufflepuff"
                                    ? globals.hufSecundario
                                    : globals.grySecundario,
                    width: 2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 140,
              height: 50,
              child: Center(
                  child: Text(
                'T. RESTANTE: $contador',
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold),
              )),
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
                color: globals.casaHogwarts == "Gryffindor"
                    ? globals.gryPrincipal
                    : globals.casaHogwarts == "Slytherin"
                        ? globals.slyPrincipal
                        : globals.casaHogwarts == "Ravenclaw"
                            ? globals.ravPrincipal
                            : globals.casaHogwarts == "Hufflepuff"
                                ? globals.hufPrincipal
                                : globals.gryPrincipal.withOpacity(0.9),
                border: Border.all(
                    color: globals.casaHogwarts == "Gryffindor"
                        ? globals.grySecundario
                        : globals.casaHogwarts == "Slytherin"
                            ? globals.slySecundario
                            : globals.casaHogwarts == "Ravenclaw"
                                ? globals.ravSecundario
                                : globals.casaHogwarts == "Hufflepuff"
                                    ? globals.hufSecundario
                                    : globals.grySecundario,
                    width: 2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 140,
              height: 50,
              child: Center(
                  child: Text(
                'PUNTUACIÓN: $puntuacion',
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Stack(children: [
            Container(
              margin: EdgeInsets.only(top: 80, left: 20, bottom: 20, right: 20),
              height: MediaQuery.of(context).size.height / 1,
              decoration: BoxDecoration(
                  color: globals.gryPrincipal,
                  border: Border.all(
                      color: globals.casaHogwarts == "Gryffindor"
                          ? globals.grySecundario
                          : globals.casaHogwarts == "Slytherin"
                              ? globals.slySecundario
                              : globals.casaHogwarts == "Ravenclaw"
                                  ? globals.ravSecundario
                                  : globals.casaHogwarts == "Hufflepuff"
                                      ? globals.hufSecundario
                                      : globals.grySecundario,
                      width: 3)),
            ),
            GestureDetector(
              child: AnimatedContainer(
                margin: EdgeInsets.only(left: left, top: top),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/snitch.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 100),
              ),
              onTap: () {
                setState(() {
                  // var puntuacionVieja = puntuacion;
                  puntuacion++;
                  // velocidad -= 1;
                  // if (velocidad == 0) {
                  //   velocidad = 100;
                  // }
                  // if (puntuacionVieja != puntuacion) {
                  //   timer2 = Timer.periodic(Duration(milliseconds: velocidad),
                  //       (Timer t) => changePosition());
                  // }
                });
              },
            ),
          ]),
        ],
      ),
    );
  }
}
