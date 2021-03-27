import 'dart:convert';


preguntasRespuestasModelo preguntasRespuestasModeloJson(String str)=> preguntasRespuestasModelo.fromJson(json.decode(str));

String preguntasRespuestasModeloToJson(preguntasRespuestasModelo data) => json.encode(data.toJson());

//modelo de preguntasRespuestas
class preguntasRespuestasModelo{
  String id;
  int numRespuesta;
  String respuesta;
  String imagen;
  int puntos;

  preguntasRespuestasModelo({this.id,this.numRespuesta,this.respuesta,this.imagen,this.puntos});

  factory preguntasRespuestasModelo.fromJson(Map<String,dynamic> json){
   return preguntasRespuestasModelo(
    id: json["_id"],
    numRespuesta: json["numRespuesta"],
    respuesta: json["respuesta"],
    imagen: json["imagen"],
    puntos: json["puntos"]
  );

  }

  Map<String,dynamic> toJson()=>{
    "_id": id,
    "numRespuesta": numRespuesta,
    "respuesta": respuesta,
    "imagen": imagen,
    "puntos": puntos,
  };


}
