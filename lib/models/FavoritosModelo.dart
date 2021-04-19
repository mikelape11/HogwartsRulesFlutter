import 'dart:convert';
import 'package:hogwarts_rules/models/ProductosModelo.dart';

FavoritosModelo FavoritosModeloJson(String str)=> FavoritosModelo.fromJson(json.decode(str));

String FavoritosModeloToJson(FavoritosModelo data) => json.encode(data.toJson());

//modelo de usuario
class FavoritosModelo{
  String id;
	String idUsuario;
	String idProducto;


  FavoritosModelo({this.id,this.idUsuario,this.idProducto});

   factory FavoritosModelo.fromJson(Map<String,dynamic> json){
     

   return FavoritosModelo(
    id: json["_id"],
    idUsuario: json["idUsuario"],
    idProducto: json["idProducto"],
  
  
  );

  }

  Map<String,dynamic> toJson()=>{
    "_id": id,
    "idUsuario": idUsuario,
    "idProducto": idProducto, 
  };


}