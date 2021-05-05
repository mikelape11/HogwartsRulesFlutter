import 'dart:convert';

RankingModelo RankingModeloJson(String str)=> RankingModelo.fromJson(json.decode(str));

String RankingModeloToJson(RankingModelo data) => json.encode(data.toJson());

//modelo de usuario
class RankingModelo{
  String id;
  String usuario;
  int puntos;
  String casaHogwarts;


  RankingModelo({this.id,this.usuario,this.puntos,this.casaHogwarts});

  factory RankingModelo.fromJson(Map<String,dynamic> json) => RankingModelo(
    id: json["_id"],
    usuario: json["usuario"],
    puntos: json["puntos"],
    casaHogwarts: json["casaHogwarts"],
  );

  Map<String,dynamic> toJson()=>{
    "_id": id,
    "usuario": usuario,
    "puntos": puntos,
    "casaHogwarts": casaHogwarts,
  };


}