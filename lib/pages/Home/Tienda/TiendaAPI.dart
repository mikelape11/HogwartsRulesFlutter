import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hogwarts_rules/models/ProductosModelo.dart';
import 'package:http/http.dart' as http;
import 'package:hogwarts_rules/models/ImagenRespuestasModelo.dart';

import '../../../models/CarritoModelo.dart';
import '../../../models/FavoritosModelo.dart';
import '../../../models/FavoritosModelo.dart';
import '../../../models/FavoritosModelo.dart';
import '../../../models/ProductosModelo.dart';
import '../../../models/ProductosModelo.dart';
import '../../../models/ProductosModelo.dart';

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

    //DETALLES
    Future<FavoritosModelo> registrarFavorito(String idUsuario, List<ProductosModelo> productos) async{
    var Url = "http://10.0.2.2:8080/addFavorito";
    var response = await http.post(Url,headers:<String , String>{"Content-Type": "application/json"},
    body:jsonEncode(<String , dynamic>{
      "idUsuario" : idUsuario,
      "productos" : productos,
    }));
    }

  Future<FavoritosModelo> actualizarFavoritos(FavoritosModelo favoritos) async{
    var Url = "http://10.0.2.2:8080/actualizarFavoritos";
    var response = await http.put(Url,headers:<String , String>{"Content-Type": "application/json"},
    body: jsonEncode(favoritos));
  }

  Future<FavoritosModelo> deleteFavoritos(String id, List<ProductosModelo> prod) async{
   var Url =     Uri.parse('http://10.0.2.2:8080/eliminarProductoFav');
     var response = await http.put(Url,headers:<String , String>{"Content-Type": "application/json"},
    body:jsonEncode(<String , dynamic>{
      "_id" : id,
      "productos" : prod,
    }));
    
  }

    Future<CarritoModelo> registrarCarrito(String idUsuario, List<ProductosModelo> productos) async{
    var Url = "http://10.0.2.2:8080/addCarrito";
    var response = await http.post(Url,headers:<String , String>{"Content-Type": "application/json"},
    body:jsonEncode(<String , dynamic>{
      "idUsuario" : idUsuario,
      "productos" : productos,
    }));
  }

  //FAVORITOS
  Future<List<FavoritosModelo>> getFavoritos(String idUsuario) async {    
      var data = await http.get('http://10.0.2.2:8080/todosFavoritos/$idUsuario');
      var jsonData = json.decode(data.body);

      List<FavoritosModelo> favoritos = []; 
      for (var e in jsonData) {
        FavoritosModelo favorito = new FavoritosModelo();
        favorito.id = e["_id"];
        favorito.idUsuario = e["idUsuario"];
        var list = e['productos'] as List;
        favorito.productos =  list.map((i) => ProductosModelo.fromJson(i)).toList();
        favoritos.add(favorito);
      }
      return favoritos;
    }

    // Future<List<ProductosModelo>> getProductosFavoritos(String idProducto) async {    
    //   var data = await http.get('http://10.0.2.2:8080/productosFavoritos/$idProducto');
    //   var jsonData = json.decode(data.body);

    //   List<ProductosModelo> productos = [];      
    //   for (var e in jsonData) {
    //     ProductosModelo producto = new ProductosModelo();
    //     producto.id = e["_id"];
    //     producto.nombre = e["nombre"];
    //     producto.cantidad = e["cantidad"];
    //     producto.precio = e["precio"];
    //     producto.casa = e["casa"];
    //     producto.tipo = e["tipo"];
    //     var list = e['foto'] as List;
    //     producto.foto =  list.map((i) => imagenRespuestasModelo.fromJson(i)).toList();

    //     productos.add(producto);
    //   }
    //   return productos;
    // }


class _TiendaAPIState extends State<TiendaAPI> {

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}