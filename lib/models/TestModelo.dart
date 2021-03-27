import 'dart:convert';

import 'package:hogwarts_rules/models/PreguntasRespuestasModelo.dart';

TestModelo TestModeloJson(String str)=> TestModelo.fromJson(json.decode(str));

String TestModeloToJson(TestModelo data) => json.encode(data.toJson());

//modelo de usuario
class TestModelo{
  String id;
  String numPregunta;
  String pregunta;
  List<preguntasRespuestasModelo> respuestas;

  TestModelo({this.id,this.numPregunta,this.pregunta,this.respuestas});
  
  factory TestModelo.fromJson(Map<String,dynamic> json){
      var list = json['respuestas'] as List;
      List<preguntasRespuestasModelo> lista = list.map((i) => preguntasRespuestasModelo.fromJson(i)).toList();

   return TestModelo(
    id: json["_id"],
    numPregunta: json["numPregunta"],
    pregunta: json["pregunta"],
    respuestas: lista,
  
  );

  }

  Map<String,dynamic> toJson()=>{
    "_id": id,
    "numPregunta": numPregunta,
    "pregunta": pregunta,
  };
}