import 'dart:convert';

import 'dart:ffi';

OpinionModelo OpinionModeloJson(String str)=> OpinionModelo.fromJson(json.decode(str));

String OpinionModeloToJson(OpinionModelo data) => json.encode(data.toJson());

//modelo de usuario
class OpinionModelo{
  String id;
  String usuario;
  String valoracion;
  double puntuacion;
  String avatar;


  OpinionModelo({this.id,this.usuario,this.valoracion,this.puntuacion,this.avatar});

  factory OpinionModelo.fromJson(Map<String,dynamic> json) => OpinionModelo(
    id: json["_id"],
    usuario: json["usuario"],
    valoracion: json["valoracion"],
    puntuacion: json["puntuacion"],
    avatar: json["avatar"]
  );

  Map<String,dynamic> toJson()=>{
    "_id": id,
    "usuario": usuario,
    "valoracion": valoracion,
    "puntuacion": puntuacion,
    "avatar": avatar
  };

  String get idUsuario => id;

  String get usuarioUsuario => usuario;

  String get valoracionUsuario => valoracion;

  double get puntuacionUsuario => puntuacion;

  String get avatarUsuario => avatar;

}