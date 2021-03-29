import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hogwarts_rules/models/PreguntasRespuestasModelo.dart';

import '../../models/TestModelo.dart';

class TestAPI extends StatefulWidget {
  const TestAPI({Key key}) : super(key: key);

  @override
  _TestAPIState createState() => _TestAPIState();
}

    Future<List<TestModelo>> getTest() async {    
      var data = await http.get('http://10.0.2.2:8080/getPreguntasRespuestas');
      var jsonData = json.decode(utf8.decode(data.bodyBytes));
      
      List<TestModelo> preguntas = []; 
      for (var e in jsonData) {
        TestModelo pregunta = new TestModelo();
        pregunta.numPregunta = e["numPregunta"];
        pregunta.pregunta = e["pregunta"];
        var list = e['respuestas'] as List;
        pregunta.respuestas =  list.map((i) => preguntasRespuestasModelo.fromJson(i)).toList();
        preguntas.add(pregunta);
      }
      return preguntas;
    }


class _TestAPIState extends State<TestAPI> {

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}