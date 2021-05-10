import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hogwarts_rules/models/PreguntasRespuestasTestVaritaPatronusModelo.dart';
import 'package:hogwarts_rules/models/TestPatronusModelo.dart';
import 'package:hogwarts_rules/models/TestVaritaModelo.dart';
import 'package:http/http.dart' as http;
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import '../../../../models/UsuarioModelo.dart';

class TestPatronusAPI extends StatefulWidget {
  const TestPatronusAPI({Key key}) : super(key: key);

  @override
  _TestPatronusAPIState createState() => _TestPatronusAPIState();
}

    Future<List<TestPatronusModelo>> getTestPatronus() async {    
      var data = await http.get(globals.ip+'/getPreguntasRespuestasPatronus');
      var jsonData = json.decode(utf8.decode(data.bodyBytes));
      
      List<TestPatronusModelo> preguntas = []; 
      for (var e in jsonData) {
        TestPatronusModelo pregunta = new TestPatronusModelo();
        pregunta.numPregunta = e["numPregunta"];
        pregunta.pregunta = e["pregunta"];
        var list = e['respuestas'] as List;
        pregunta.respuestas =  list.map((i) => PreguntasRespuestasTestVaritaPatronusModelo.fromJson(i)).toList();
        preguntas.add(pregunta);
      }
      return preguntas;
    }

Future<UsuarioModelo> actualiziarPatronus(UsuarioModelo usuario) async{
    var Url = globals.ip+'/actualiziarPatronus';
    var response = await http.put(Url,headers:<String , String>{"Content-Type": "application/json"},
    body: jsonEncode(usuario));
  }


class _TestPatronusAPIState extends State<TestPatronusAPI> {

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}