import 'dart:convert';
import 'package:hogwarts_rules/models/ProductosModelo.dart';

import 'ProductosModelo.dart';

FavoritosModelo FavoritosModeloJson(String str)=> FavoritosModelo.fromJson(json.decode(str));

String FavoritosModeloToJson(FavoritosModelo data) => json.encode(data.toJson());

//modelo de usuario
class FavoritosModelo{
  String id;
	String idUsuario;
	List<ProductosModelo> productos;


  FavoritosModelo({this.id,this.idUsuario,this.productos});

   factory FavoritosModelo.fromJson(Map<String,dynamic> json){
     var list = json['productos'] as List;
    List<ProductosModelo> lista = list.map((i) => ProductosModelo.fromJson(i)).toList();

   return FavoritosModelo(
    id: json["_id"],
    idUsuario: json["idUsuario"],
    productos: lista,
  
  
  );

  }

 Map toJson() {
    List<Map> prods =
        this.productos != null ? this.productos.map((i) => i.toJson()).toList() : null;
    
    return {
    "_id": id,
    "idUsuario": idUsuario,
    "productos": prods,
  };
 }

}