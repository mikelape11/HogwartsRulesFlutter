import 'dart:convert';

import 'package:hogwarts_rules/models/ImagenRespuestasModelo.dart';


preguntasRespuestasModelo preguntasRespuestasModeloJson(String str)=> preguntasRespuestasModelo.fromJson(json.decode(str));

String preguntasRespuestasModeloToJson(preguntasRespuestasModelo data) => json.encode(data.toJson());

//modelo de preguntasRespuestas
class preguntasRespuestasModelo{
  String id;
  int numRespuesta;
  String respuesta;
  List<imagenRespuestasModelo> imagen;
  String puntos;

  preguntasRespuestasModelo({this.id,this.numRespuesta,this.respuesta,this.imagen,this.puntos});

  factory preguntasRespuestasModelo.fromJson(Map<String,dynamic> json){
      var list = json['imagen'] as List;
      List<imagenRespuestasModelo> lista = list.map((i) => imagenRespuestasModelo.fromJson(i)).toList();

   return preguntasRespuestasModelo(
    id: json["_id"],
    numRespuesta: json["numRespuesta"],
    respuesta: json["respuesta"],
    imagen: lista,
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
