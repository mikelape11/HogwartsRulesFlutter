import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hogwarts_rules/models/EleccionCasaModelo.dart';
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

     Future<List<EleccionCasaModelo>> geteleccionCasaTodos() async {    
      var data = await http.get('http://10.0.2.2:8080/eleccionCasaTodos');
      var jsonData = json.decode(data.body);
      
      List<EleccionCasaModelo> puntos = []; 
      for (var e in jsonData) {
        EleccionCasaModelo eleccion = new EleccionCasaModelo();
        eleccion.id = e['_id'];
        eleccion.id_usuario = e['id_usuario'];
        eleccion.puntosGry = e['puntosGry'];
        eleccion.puntosSly = e['puntosSly'];
        eleccion.puntosHuff = e['puntosHuff'];
        eleccion.puntosRav = e['puntosRav'];
        puntos.add(eleccion);

    }
    return puntos;



     }

    
  Future<EleccionCasaModelo> actualizarPuntos(EleccionCasaModelo puntos) async{
    var Url = "http://10.0.2.2:8080/actualizarPuntos";
    var response = await http.put(Url,headers:<String , String>{"Content-Type": "application/json"},
    body: jsonEncode(puntos));
  }


  Future<EleccionCasaModelo> registrarEleccionCasa(String id_usuario, int puntosGry, int puntosSly, int puntosHuff, int puntosRav) async{
    var Url = "http://10.0.2.2:8080/registrarEleccionCasa";
    var response = await http.post(Url,headers:<String , String>{"Content-Type": "application/json"},
    body:jsonEncode(<String , String>{
      "id_usuario" : id_usuario,
      "puntosGry" : puntosGry.toString(),
      "puntosSly": puntosSly.toString(),
      "puntosHuff": puntosHuff.toString(),
      "puntosRav": puntosRav.toString(),


    }));
  }


class _TestAPIState extends State<TestAPI> {

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}