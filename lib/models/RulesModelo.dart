import 'dart:convert';

import 'package:hogwarts_rules/models/ComentariosModelo.dart';
import 'package:hogwarts_rules/models/RulesFavoritosModelo.dart';

import 'ImagenRespuestasModelo.dart';

RulesModelo RulesModeloJson(String str)=> RulesModelo.fromJson(json.decode(str));

String RulesModeloToJson(RulesModelo data) => json.encode(data.toJson());

//modelo de usuario
class RulesModelo{
  String id;
  String usuario;
  String avatar;
  int rol;
  String rule;
  List<imagenRespuestasModelo> foto;
  List<ComentariosModelo> comentarios;
  List<RulesFavoritosModelo> favoritos;


  RulesModelo({this.id,this.usuario,this.avatar,this.rol,this.rule,this.foto,this.comentarios,this.favoritos});

  factory RulesModelo.fromJson(Map<String,dynamic> json){
    var list = json['comentarios'] as List;
    List<ComentariosModelo> lista = list.map((i) => ComentariosModelo.fromJson(i)).toList();
    var list2 = json['favoritos'] as List;
    List<RulesFavoritosModelo> lista2 = list2.map((i) => RulesFavoritosModelo.fromJson(i)).toList();
    var list3 = json['foto'] as List;
    List<imagenRespuestasModelo> lista3 = list3.map((i) => imagenRespuestasModelo.fromJson(i)).toList();

  return RulesModelo(
    id: json["_id"],
    usuario: json["usuario"],
    avatar: json["avatar"],
    rol: json["rol"],
    rule: json["rule"],
    foto: lista3,
    comentarios: lista,
    favoritos: lista2,
  );
   
  }

  Map toJson() {
    List<Map> coments =
        this.comentarios != null ? this.comentarios.map((i) => i.toJson()).toList() : null;
    List<Map> favs =
        this.favoritos != null ? this.favoritos.map((i) => i.toJson()).toList() : null;
    List<Map> fotos =
        this.foto != null ? this.foto.map((i) => i.toJson()).toList() : null;

    return {
    "_id": id,
    "usuario": usuario,
    "avatar": avatar,
    "rol": rol,
    "rule": rule,
    "foto": fotos,
    "comentarios": coments,
    "favoritos": favs,
  };

  }
}