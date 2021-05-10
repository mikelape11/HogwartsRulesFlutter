import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:file_picker/file_picker.dart';
import 'package:hogwarts_rules/widgets/custom_alert_dialog.dart';
import 'dart:io' as Io;
import 'package:http/http.dart' as http;

class GamesGuessWho extends StatefulWidget {
  @override
  _GamesGuessWhoState createState() => _GamesGuessWhoState();
}

class _GamesGuessWhoState extends State<GamesGuessWho> {
  var filePath = "images/LOGOS/Logo3.png";

  var imageByte;

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                    child: Text(
                  'GUESS WHO',
                  style: TextStyle(
                      fontFamily: 'BluuNext',
                      fontSize: 40,
                      color: Colors.white),
                )),
              ),
              SizedBox(height: 25),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
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
                        width: 3),
                    image: DecorationImage(
                      image: AssetImage(filePath),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  height: 300,
                  width: 300,
                  child: Image.file(File(filePath)),
                  // child: Icon(
                  //   Icons.photo,
                  //   size: 100,
                  //   color: globals.casaHogwarts == "Gryffindor"
                  //       ? globals.grySecundario
                  //       : globals.casaHogwarts == "Slytherin"
                  //           ? globals.slySecundario
                  //           : globals.casaHogwarts == "Ravenclaw"
                  //               ? globals.ravSecundario
                  //               : globals.casaHogwarts == "Hufflepuff"
                  //                   ? globals.hufSecundario
                  //                   : globals.grySecundario,
                  // ),
                ),
                onTap: () async {
                  FilePickerResult result =
                      await FilePicker.platform.pickFiles();
                  PlatformFile fileGlobal = result.files.first;
                  filePath = fileGlobal.path;
                  imageByte = Io.File(fileGlobal.path).readAsBytesSync();
                  setState(() {});
                },
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: RaisedButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                    'ADIVINA',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () async {
                    var data = await http.post('http://52.166.205.229:80/guesswho',
                        body: imageByte);
                    print(data.body);
                    showDialog(
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
                                            : globals.casaHogwarts ==
                                                    "Hufflepuff"
                                                ? globals.hufPrincipal
                                                : globals.gryPrincipal
                                                    .withOpacity(0.9),
                                border: Border.all(
                                    color: globals.casaHogwarts == "Gryffindor"
                                        ? globals.grySecundario
                                        : globals.casaHogwarts == "Slytherin"
                                            ? globals.slySecundario
                                            : globals.casaHogwarts ==
                                                    "Ravenclaw"
                                                ? globals.ravSecundario
                                                : globals.casaHogwarts ==
                                                        "Hufflepuff"
                                                    ? globals.hufSecundario
                                                    : globals.grySecundario,
                                    width: 3),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'images/Juego/' + data.body + ".png"),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              width: 300,
                              height: 300,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 15),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black87,
                                        image: DecorationImage(
                                          image: AssetImage('images/Juego/' +
                                              data.body +
                                              ".png"),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  //var imageByte = Io.File(file.path).readAsBytesSync();
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                  child: Text(
                'Pulsa el botón para ver a que personaje de Harry Potter te pareces más',
                style: TextStyle(
                    fontFamily: 'BluuNext', fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ],
      ),
    );
  }
}