import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hogwarts_rules/models/ProductosModelo.dart';
import 'package:http/http.dart' as http;
import 'package:hogwarts_rules/models/ImagenRespuestasModelo.dart';

class TiendaAPI extends StatefulWidget {
  const TiendaAPI({Key key}) : super(key: key);

  @override
  _TiendaAPIState createState() => _TiendaAPIState();
}

Future<List<ProductosModelo>> getProductos() async {    
      var data = await http.get('http://10.0.2.2:8080/todosProductos');
      var jsonData = json.decode(data.body);

      List<ProductosModelo> productos = []; 
      for (var e in jsonData) {
        ProductosModelo producto = new ProductosModelo();
        producto.id = e["_id"];
        producto.nombre = e["nombre"];
        producto.cantidad = e["cantidad"];
        producto.precio = e["precio"];
        producto.casa = e["casa"];
        producto.tipo = e["tipo"];
        var list = e['foto'] as List;
        producto.foto =  list.map((i) => imagenRespuestasModelo.fromJson(i)).toList();

        productos.add(producto);
      }
      return productos;
    }

    Future<List<ProductosModelo>> getProductosCasa(String casa) async {    
      var data = await http.get('http://10.0.2.2:8080/todosProductosCasa/$casa');
      var jsonData = json.decode(data.body);

      List<ProductosModelo> productos = []; 
      for (var e in jsonData) {
        ProductosModelo producto = new ProductosModelo();
        producto.id = e["_id"];
        producto.nombre = e["nombre"];
        producto.cantidad = e["cantidad"];
        producto.precio = e["precio"];
        producto.casa = e["casa"];
        producto.tipo = e["tipo"];
        var list = e['foto'] as List;
        producto.foto =  list.map((i) => imagenRespuestasModelo.fromJson(i)).toList();

        productos.add(producto);
      }
      return productos;
    }

    Future<List<ProductosModelo>> getProductosTipo(String tipo) async {    
      var data = await http.get('http://10.0.2.2:8080/todosProductosTipo/$tipo');
      var jsonData = json.decode(data.body);

      List<ProductosModelo> productos = []; 
      for (var e in jsonData) {
        ProductosModelo producto = new ProductosModelo();
        producto.id = e["_id"];
        producto.nombre = e["nombre"];
        producto.cantidad = e["cantidad"];
        producto.precio = e["precio"];
        producto.casa = e["casa"];
        producto.tipo = e["tipo"];
        var list = e['foto'] as List;
        producto.foto =  list.map((i) => imagenRespuestasModelo.fromJson(i)).toList();

        productos.add(producto);
      }
      return productos;
    }

class _TiendaAPIState extends State<TiendaAPI> {

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}