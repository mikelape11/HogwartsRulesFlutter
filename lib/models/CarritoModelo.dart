import 'dart:convert';
import 'package:hogwarts_rules/models/ProductosModelo.dart';

CarritoModelo CarritoModeloJson(String str)=> CarritoModelo.fromJson(json.decode(str));

String CarritoModeloToJson(CarritoModelo data) => json.encode(data.toJson());

//modelo de usuario
class CarritoModelo{
  String id;
	String idUsuario;
	List<ProductosModelo> productos;

  CarritoModelo({this.id,this.idUsuario,this.productos});

   factory CarritoModelo.fromJson(Map<String,dynamic> json){
      var list = json['productos'] as List;
      List<ProductosModelo> lista = list.map((i) => ProductosModelo.fromJson(i)).toList();

   return CarritoModelo(
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