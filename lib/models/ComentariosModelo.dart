import 'dart:convert';


ComentariosModelo ComentariosModeloJson(String str)=> ComentariosModelo.fromJson(json.decode(str));

String ComentariosModeloToJson(ComentariosModelo data) => json.encode(data.toJson());

class ComentariosModelo{
  String usuario;
  String avatar;
  String comentario;

  ComentariosModelo({this.usuario,this.avatar,this.comentario});

  factory ComentariosModelo.fromJson(Map<String,dynamic> json){
   return ComentariosModelo(

    usuario: json["usuario"],
    avatar: json["avatar"],
    comentario: json["comentario"],

  );

  }

  Map<String,dynamic> toJson()=>{
    "usuario": usuario,
    "avatar": avatar,
    "comentario": comentario,

  };


}
