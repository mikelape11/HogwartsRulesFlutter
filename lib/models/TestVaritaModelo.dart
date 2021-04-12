import 'dart:convert';

import 'PreguntasRespuestasTestVaritaPatronusModelo.dart';

TestVaritaModelo TestVaritaModeloJson(String str)=> TestVaritaModelo.fromJson(json.decode(str));

String TestVaritaModeloToJson(TestVaritaModelo data) => json.encode(data.toJson());

//modelo de usuario
class TestVaritaModelo{
  String id;
  int numPregunta;
  String pregunta;
  List<PreguntasRespuestasTestVaritaPatronusModelo> respuestas;

  TestVaritaModelo({this.id,this.numPregunta,this.pregunta,this.respuestas});
  
  factory TestVaritaModelo.fromJson(Map<String,dynamic> json){
      var list = json['respuestas'] as List;
      List<PreguntasRespuestasTestVaritaPatronusModelo> lista = list.map((i) => PreguntasRespuestasTestVaritaPatronusModelo.fromJson(i)).toList();

   return TestVaritaModelo(
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