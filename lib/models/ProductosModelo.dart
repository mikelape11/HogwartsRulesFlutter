import 'dart:convert';
import 'package:hogwarts_rules/models/ImagenRespuestasModelo.dart';

ProductosModelo ProductosModeloJson(String str)=> ProductosModelo.fromJson(json.decode(str));

String ProductosModeloToJson(ProductosModelo data) => json.encode(data.toJson());

//modelo de usuario
class ProductosModelo{
  String id;
  String nombre;
  int cantidad;
  int precio;
  String casa;
  String tipo;
	List<imagenRespuestasModelo> foto;


  ProductosModelo({this.id,this.nombre,this.cantidad,this.precio,this.casa,this.tipo,this.foto});

  factory ProductosModelo.fromJson(Map<String,dynamic> json){
      var list = json['foto'] as List;
      List<imagenRespuestasModelo> lista = list.map((i) => imagenRespuestasModelo.fromJson(i)).toList();

   return ProductosModelo(
    id: json["_id"],
    nombre: json["nombre"],
    cantidad: json["cantidad"],
    precio: json['precio'],
    casa: json['casa'],
    tipo: json['tipo'],
    foto: lista,
  
  );

  }

Map<String,dynamic> toJson()=>{
    "_id": id,
    "nombre": nombre,
    "cantidad": cantidad,
    "precio": precio,
    "casa": casa,
    "tipo": tipo,
  };

  String get idUsuario => id;

  String get usuarioUsuario => nombre;

  int get cantidadUsuario => cantidad;

  int get precioUsuario => precio;

  String get casaUsuario => casa;

  String get tipoUsuario => tipo;


}