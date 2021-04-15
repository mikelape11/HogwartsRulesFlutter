import 'dart:convert';

ComprasModelo ComprasModeloJson(String str)=> ComprasModelo.fromJson(json.decode(str));

String ComprasModeloToJson(ComprasModelo data) => json.encode(data.toJson());

//modelo de usuario
class ComprasModelo{
  String id;
	String idUsuario;
	String idProducto;
  int cantidad;


  ComprasModelo({this.id,this.idUsuario,this.idProducto,this.cantidad});

  factory ComprasModelo.fromJson(Map<String,dynamic> json) => ComprasModelo(
    id: json["_id"],
    idUsuario: json["idUsuario"],
    idProducto: json["idProducto"],
    cantidad: json["cantidad"],

  );

  Map<String,dynamic> toJson()=>{
    "_id": id,
    "idUsuario": idUsuario,
    "idProducto": idProducto,
    "cantidad": cantidad,
  };


}