import 'dart:convert';

import 'package:hogwarts_rules/models/ImagenRespuestasModelo.dart';


PreguntasRespuestasTestVaritaPatronusModelo PreguntasRespuestasTestVaritaPatronusModeloJson(String str)=> PreguntasRespuestasTestVaritaPatronusModelo.fromJson(json.decode(str));

String PreguntasRespuestasTestVaritaPatronusModeloToJson(PreguntasRespuestasTestVaritaPatronusModelo data) => json.encode(data.toJson());

//modelo de preguntasRespuestas
class PreguntasRespuestasTestVaritaPatronusModelo{
  String id;
  int numRespuesta;
  String respuesta;
  String puntos;

  PreguntasRespuestasTestVaritaPatronusModelo({this.id,this.numRespuesta,this.respuesta,this.puntos});

  factory PreguntasRespuestasTestVaritaPatronusModelo.fromJson(Map<String,dynamic> json){
   return PreguntasRespuestasTestVaritaPatronusModelo(
    id: json["_id"],
    numRespuesta: json["numRespuesta"],
    respuesta: json["respuesta"],
    puntos: json['puntos']
  
  );

  }

  Map<String,dynamic> toJson()=>{
    "_id": id,
    "numRespuesta": numRespuesta,
    "respuesta": respuesta,
    "puntos": puntos,
  };


}
