import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hogwarts_rules/models/PreguntasRespuestasTestVaritaPatronusModelo.dart';
import 'package:hogwarts_rules/models/TestVaritaModelo.dart';
import 'package:http/http.dart' as http;
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import '../../../../models/UsuarioModelo.dart';

class TestVaritaAPI extends StatefulWidget {
  const TestVaritaAPI({Key key}) : super(key: key);

  @override
  _TestVaritaAPIState createState() => _TestVaritaAPIState();
}

    Future<List<TestVaritaModelo>> getTestVarita() async {    
      var data = await http.get(globals.ip+'/getPreguntasRespuestasVarita');
      var jsonData = json.decode(utf8.decode(data.bodyBytes));
      
      List<TestVaritaModelo> preguntas = []; 
      for (var e in jsonData) {
        TestVaritaModelo pregunta = new TestVaritaModelo();
        pregunta.numPregunta = e["numPregunta"];
        pregunta.pregunta = e["pregunta"];
        var list = e['respuestas'] as List;
        pregunta.respuestas =  list.map((i) => PreguntasRespuestasTestVaritaPatronusModelo.fromJson(i)).toList();
        preguntas.add(pregunta);
      }
      return preguntas;
    }

Future<UsuarioModelo> actualiziarVarita(UsuarioModelo usuario) async{
    var Url = globals.ip+'/actualiziarVarita';
    var response = await http.put(Url,headers:<String , String>{"Content-Type": "application/json"},
    body: jsonEncode(usuario));
  }


class _TestVaritaAPIState extends State<TestVaritaAPI> {

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}