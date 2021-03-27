import 'dart:convert';

TestModelo TestModeloJson(String str)=> TestModelo.fromJson(json.decode(str));

String TestModeloToJson(TestModelo data) => json.encode(data.toJson());

//modelo de usuario
class TestModelo{
  String id;
  String numPregunta;
  String pregunta;
  String numRespuesta;
  String respuesta;
  String imagen;
  String puntos;

  TestModelo({this.id,this.numPregunta,this.pregunta,this.numRespuesta, this.respuesta, this.imagen, this.puntos});

  factory TestModelo.fromJson(Map<String,dynamic> json) => TestModelo(
    id: json["_id"],
    numPregunta: json["numPregunta"],
    pregunta: json["pregunta"],
    numRespuesta: json["numRespuesta"],
    respuesta: json["respuesta"],
    imagen: json["imagen"],
    puntos: json["puntos"],
  );

  Map<String,dynamic> toJson()=>{
    "_id": id,
    "numPregunta": numPregunta,
    "pregunta": pregunta,
    "numRespuesta": numRespuesta,
    "respuesta": respuesta,
    "imagen": imagen,
    "puntos": puntos,
  };

  String get idTest => id;

  String get numPreguntaTest => numPregunta;

  String get preguntaTest => pregunta;

  String get numRespuestaTest => numRespuesta;

  String get respuestaTest => respuesta;

  String get imagenTest => imagen;

  String get puntosTest => puntos;

}