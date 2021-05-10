import 'dart:convert';

RankingModelo RankingModeloJson(String str)=> RankingModelo.fromJson(json.decode(str));

String RankingModeloToJson(RankingModelo data) => json.encode(data.toJson());

//modelo de usuario
class RankingModelo{
  String id;
  String usuario;
  String avatar;
  int puntos;
  String casaHogwarts;


  RankingModelo({this.id,this.usuario,this.avatar,this.puntos,this.casaHogwarts});

  factory RankingModelo.fromJson(Map<String,dynamic> json) => RankingModelo(
    id: json["_id"],
    usuario: json["usuario"],
    avatar: json["avatar"],
    puntos: json["puntos"],
    casaHogwarts: json["casaHogwarts"],
  );

  Map<String,dynamic> toJson()=>{
    "_id": id,
    "usuario": usuario,
    "avatar": avatar,
    "puntos": puntos,
    "casaHogwarts": casaHogwarts,
  };


}