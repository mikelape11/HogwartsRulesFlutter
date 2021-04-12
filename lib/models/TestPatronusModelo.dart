import 'dart:convert';

import 'package:hogwarts_rules/models/PreguntasRespuestasTestVaritaPatronusModelo.dart';

TestPatronusModelo TestPatronusModeloJson(String str)=> TestPatronusModelo.fromJson(json.decode(str));

String TestPatronusModeloToJson(TestPatronusModelo data) => json.encode(data.toJson());

//modelo de usuario
class TestPatronusModelo{
  String id;
  int numPregunta;
  String pregunta;
  List<PreguntasRespuestasTestVaritaPatronusModelo> respuestas;

  TestPatronusModelo({this.id,this.numPregunta,this.pregunta,this.respuestas});
  
  factory TestPatronusModelo.fromJson(Map<String,dynamic> json){
      var list = json['respuestas'] as List;
      List<PreguntasRespuestasTestVaritaPatronusModelo> lista = list.map((i) => PreguntasRespuestasTestVaritaPatronusModelo.fromJson(i)).toList();

   return TestPatronusModelo(
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