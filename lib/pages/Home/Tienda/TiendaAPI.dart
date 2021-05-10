import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hogwarts_rules/models/ProductosModelo.dart';
import 'package:http/http.dart' as http;
import 'package:hogwarts_rules/models/ImagenRespuestasModelo.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
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
      var data = await http.get(globals.ip+'/todosProductos');
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
      var data = await http.get(globals.ip+'/todosProductosCasa/$casa');
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
      var data = await http.get(globals.ip+'/todosProductosTipo/$tipo');
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

    Future<ProductosModelo> actualizarProductos(ProductosModelo productos) async{
      var Url = globals.ip+'/actualizarProductos';
      var response = await http.put(Url,headers:<String , String>{"Content-Type": "application/json"},
      body: jsonEncode(productos));
    }


    //DETALLES
    Future<FavoritosModelo> registrarFavorito(String idUsuario, List<ProductosModelo> productos) async{
    var Url = globals.ip+'/addFavorito';
    var response = await http.post(Url,headers:<String , String>{"Content-Type": "application/json"},
    body:jsonEncode(<String , dynamic>{
      "idUsuario" : idUsuario,
      "productos" : productos,
    }));
    }

  Future<FavoritosModelo> actualizarFavoritos(FavoritosModelo favoritos) async{
    var Url = globals.ip+'/actualizarFavoritos';
    var response = await http.put(Url,headers:<String , String>{"Content-Type": "application/json"},
    body: jsonEncode(favoritos));
  }

  Future<FavoritosModelo> deleteFavoritos(String id, List<ProductosModelo> prod) async{
   var Url =     Uri.parse(globals.ip+'/eliminarProductoFav');
     var response = await http.put(Url,headers:<String , String>{"Content-Type": "application/json"},
    body:jsonEncode(<String , dynamic>{
      "_id" : id,
      "productos" : prod,
    }));
    
  }


  //FAVORITOS
  Future<List<FavoritosModelo>> getFavoritos(String idUsuario) async {    
      var data = await http.get(globals.ip+'/todosFavoritos/$idUsuario');
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

    //CARRITO
    Future<List<CarritoModelo>> getCarrito(String idUsuario) async {    
      var data = await http.get(globals.ip+'/todosCarrito/$idUsuario');
      var jsonData = json.decode(data.body);

      List<CarritoModelo> carrito = []; 
      for (var e in jsonData) {
        CarritoModelo carr = new CarritoModelo();
        carr.id = e["_id"];
        carr.idUsuario = e["idUsuario"];
        var list = e['productos'] as List;
        carr.productos =  list.map((i) => ProductosModelo.fromJson(i)).toList();
        carrito.add(carr);
      }
      return carrito;
    }
    Future<CarritoModelo> registrarCarrito(String idUsuario, List<ProductosModelo> productos) async{
      var Url = globals.ip+'/addCarrito';
      var response = await http.post(Url,headers:<String , String>{"Content-Type": "application/json"},
      body:jsonEncode(<String , dynamic>{
        "idUsuario" : idUsuario,
        "productos" : productos,
      }));
    }

  Future<CarritoModelo> actualizarCarrito(CarritoModelo favoritos) async{
    var Url = globals.ip+'/actualizarCarrito';
    var response = await http.put(Url,headers:<String , String>{"Content-Type": "application/json"},
    body: jsonEncode(favoritos));
  }

  Future<CarritoModelo> deleteCarrito(String id, List<ProductosModelo> prod) async{
    var Url =     Uri.parse(globals.ip+'/eliminarCarrito');
    var response = await http.put(Url,headers:<String , String>{"Content-Type": "application/json"},
    body:jsonEncode(<String , dynamic>{
      "_id" : id,
      "productos" : prod,
    }));
    
  }



class _TiendaAPIState extends State<TiendaAPI> {

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}