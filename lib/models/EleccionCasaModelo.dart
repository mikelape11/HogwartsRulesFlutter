import 'dart:convert';


EleccionCasaModelo EleccionCasaModeloJson(String str)=> EleccionCasaModelo.fromJson(json.decode(str));

String EleccionCasaModeloToJson(EleccionCasaModelo data) => json.encode(data.toJson());

//modelo de usuario
class EleccionCasaModelo{
  String id;
  String id_usuario;
  int puntosGry;
  int puntosSly;
  int puntosRav;
  int puntosHuff;

  EleccionCasaModelo({this.id,this.id_usuario,this.puntosGry,this.puntosSly,this.puntosRav,this.puntosHuff});
  
  factory EleccionCasaModelo.fromJson(Map<String,dynamic> json){
   return EleccionCasaModelo(
    id: json["_id"],
    id_usuario: json["id_usuario"],
    puntosGry: json["puntosGry"],
    puntosSly: json['puntosSly'],
    puntosRav: json['puntosRav'],
    puntosHuff: json['puntosHuff'],
  
  );

  }

  Map<String,dynamic> toJson()=>{
    "_id": id,
    "id_usuario": id_usuario,
    "puntosGry": puntosGry,
    "puntosSly": puntosSly,
    "puntosRav": puntosRav,
    "puntosHuff": puntosHuff,

  };

    String get idEleccionCasa => id;
}