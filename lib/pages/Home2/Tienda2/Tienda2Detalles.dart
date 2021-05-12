import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/models/CarritoModelo.dart';
import 'package:hogwarts_rules/models/FavoritosModelo.dart';
import 'package:hogwarts_rules/models/ProductosModelo.dart';
import 'package:hogwarts_rules/pages/Ajustes2/Ajustes2.dart';
import 'package:hogwarts_rules/pages/Home/Home.dart';
import 'package:hogwarts_rules/pages/Home/Tienda/TiendaAPI.dart';
import 'package:hogwarts_rules/pages/Home2/Tienda2/Tienda2Carrito.dart';
import 'package:hogwarts_rules/pages/Home2/Tienda2/Tienda2Favoritos.dart';
import 'package:hogwarts_rules/pages/Home2/Tienda2/Tienda2Pagar.dart';
import '../../../models/ImagenRespuestasModelo.dart';

class Tienda2Detalles extends StatefulWidget {
  final String id;
  final String nombre;
  final int precio;
  final int cantidad;
  final String casa;
  final String tipo;
  final String descripcion;
  final List<imagenRespuestasModelo> foto;
  final String thumbUrl;

  Tienda2Detalles(this.id,this.nombre,this.precio,this.cantidad,this.casa,this.tipo,this.descripcion,this.foto,this.thumbUrl);

  @override
  _DetallesTiendaState createState() => _DetallesTiendaState();
}

class _DetallesTiendaState extends State<Tienda2Detalles> {
  int precio2;
  int precio3;
  FavoritosModelo favorito;
  CarritoModelo carrito1;
   int cont = 0;
  @override
  void initState() {
    precio2 = widget.precio;
    precio3 = widget.precio;
  }

  int cantidad = 1;
  int precio = 0;
  bool fav = false;
  CarritoModelo carrito;


  Icon _iconoFav(){ //CAMBIO EL ICONO DEPENDIENDO DEL TEMA
    if(fav == false) {
      return Icon(Icons.favorite_outline);
    } else {
      return Icon(Icons.favorite);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(globals.color2)//change your color here
        ),
        title: Text('Home', style: TextStyle(color: Color(globals.color2)),),
        backgroundColor: Color(globals.color1),
        centerTitle: true,
        actions: [      
          IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(Icons.favorite_outline, color: Color(globals.color2), size: 25,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Tienda2Favoritos(),
              ));
            }
          ),
          IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(Icons.shopping_cart_outlined, color: Color(globals.color2), size: 25,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Tienda2Carrito(),
              ));
            }
          ),  
          IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(Icons.settings_outlined, color: Color(globals.color2), size: 25,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Ajustes2(),
              ));
            }
          ),
        ],
        bottom: PreferredSize(
        child: Container(
          color: Color(globals.color2),
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(4.0)),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('${globals.fondoNegro3}'),
            fit: BoxFit.fitWidth,  
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                //color: Color(globals.color1),,
                border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
              ),                              
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: MemoryImage(base64Decode(widget.thumbUrl)),
                    fit: BoxFit.fitHeight,  
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(globals.color1),
                //border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Container(
                    child: Text("${widget.nombre}", style: TextStyle(color: Color(globals.color2), fontSize: 25))
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                      "${widget.descripcion}", 
                      style: TextStyle(color: Colors.white70, fontSize: 15))
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            SizedBox(width: 40),
                            Container(
                              child: IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                                icon: Icon(Icons.remove_circle_outline, color: Color(globals.color2), size: 25,),
                                onPressed: () {
                                  setState(() {
                                    if(cantidad > 1)
                                      cantidad--;  
                                      precio3 = precio2*cantidad;                               
                                  });
                                }
                              ),
                            ),
                            Container(
                              child: Text("${cantidad}", style: TextStyle(color: Colors.white70,fontSize: 25),),
                            ),
                            Container(
                              child: IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                                icon: Icon(Icons.add_circle_outline, color: Color(globals.color2), size: 25,),
                                onPressed: () {
                                  setState(() {
                                   if(cantidad < widget.cantidad){
                                      cantidad++; 
                                      precio3 = precio2*cantidad;
                                    }                              
                                  });
                                }
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Text("${precio3} €", style: TextStyle(color: Colors.white70,fontSize: 25))
                      ),
                      SizedBox(width: 90,)
                    ],
                  ),
                  SizedBox(height: 20),
                  FutureBuilder(
                    future: getFavoritos(globals.usuario),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if(!snapshot.hasData){    
                      return Center(child: CircularProgressIndicator(strokeWidth: 2));
                    }
                    for(int i=0; i<snapshot.data.length;i++){
                      for(int j=0; j<snapshot.data[i].productos.length; j++){
                        if(snapshot.data[i].productos[j].id == widget.id){
                          fav = true;         
                        }
                      }
                    }
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(                      
                            width: 80,
                            child: RaisedButton(  
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),                         
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              color: Color(globals.color4),
                              child: IconButton(
                                icon: _iconoFav(), 
                                disabledColor: Color(globals.color2),
                                iconSize: 30,),
                                onPressed: () async{
                                  if(fav == true){
                                      cont = 1;
                                  }else{
                                    cont++; 
                                  }
                                  FavoritosModelo favs = new FavoritosModelo();
                                  setState(() {
                                    if(fav == false)
                                      fav = true;                                    
                                  });
                                  if(snapshot.data.length == 0){
                                     if(fav == true && cont == 1){
                                          List<ProductosModelo> productos = [];
                                          ProductosModelo prod = new ProductosModelo();
                                          prod.id = widget.id;
                                          prod.nombre = widget.nombre;
                                          prod.cantidad = cantidad;
                                          prod.precio = precio3;
                                          prod.casa = widget.casa;
                                          prod.tipo = widget.tipo;
                                          prod.descripcion = widget.descripcion;
                                          prod.foto = widget.foto;
                                          productos.add(prod);
                                          favs = await registrarFavorito(globals.usuario, productos);
                                          setState(() {
                                            favorito = favs;
                                          });
                                      }
                                      
                                  }else{
                                     for(int i=0; i<snapshot.data.length;i++){
                                      if(snapshot.data[i].idUsuario == globals.usuario){
                                        if(fav == true && cont == 1){
                                          List<ProductosModelo> productos = [];
                                          FavoritosModelo fav = new FavoritosModelo();
                                          ProductosModelo prod = new ProductosModelo();
                                          prod.id = widget.id;
                                          prod.nombre = widget.nombre;
                                          prod.cantidad = cantidad;
                                          prod.precio = precio3;
                                          prod.casa = widget.casa;
                                          prod.tipo = widget.tipo;
                                          prod.descripcion = widget.descripcion;
                                          prod.foto = widget.foto;
                                          for(int n=0; n<snapshot.data[i].productos.length;n++){
                                            ProductosModelo prod2 = new ProductosModelo();
                                            print(snapshot.data[i].productos[n].nombre);
                                            prod2.id = snapshot.data[i].productos[n].id;
                                            prod2.nombre = snapshot.data[i].productos[n].nombre;
                                            prod2.cantidad = snapshot.data[i].productos[n].cantidad;
                                            prod2.precio = snapshot.data[i].productos[n].precio;
                                            prod2.casa = snapshot.data[i].productos[n].casa;
                                            prod2.tipo = snapshot.data[i].productos[n].tipo;
                                            prod2.descripcion = snapshot.data[i].productos[n].descripcion;
                                            prod2.foto = snapshot.data[i].productos[n].foto;
                                            productos.add(prod2);
                                          } 

                                          productos.add(prod);
                                          fav.id = snapshot.data[i].id;
                                          fav.idUsuario = globals.usuario;
                                          fav.productos = productos;
                                          favs = await actualizarFavoritos(fav);
                                          setState(() {
                                            favorito = fav;
                                          });
                                        }
                                      }else{
                                        if(fav == true && cont == 1){
                                          List<ProductosModelo> productos = [];
                                          ProductosModelo prod = new ProductosModelo();
                                          prod.id = widget.id;
                                          prod.nombre = widget.nombre;
                                          prod.cantidad = cantidad;
                                          prod.precio = precio3;
                                          prod.casa = widget.casa;
                                          prod.tipo = widget.tipo;
                                          prod.descripcion = widget.descripcion;
                                          prod.foto = widget.foto;
                                          productos.add(snapshot.data[i].productos);
                                          productos.add(prod);
                                          favs = await registrarFavorito(globals.usuario, productos);
                                          setState(() {
                                            favorito = favs;
                                          });
                                        }
                                      }
                                    }
                                  }
                                }
                            ),
                          ),
                          SizedBox(width: 10,),
                          FutureBuilder(
                            future: getCarrito(globals.usuario),
                            builder: (BuildContext context, AsyncSnapshot snapshot2) {
                            if(!snapshot2.hasData){    
                              return Center(child: CircularProgressIndicator(strokeWidth: 2));
                            }
                            return Container(                         
                              child: RaisedButton(   
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                ),  
                                padding: EdgeInsets.symmetric(vertical: 13, horizontal: 30),                     
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                color: Color(globals.color4),
                                child: Text('AÑADIR AL CARRITO', style: TextStyle(color: Color(globals.color2), fontSize: 18),),
                                onPressed: () async{
                                  CarritoModelo carrs = new CarritoModelo();
                                    if(snapshot2.data.length == 0){
                                        ProductosModelo producto = new ProductosModelo();
                                        List<ProductosModelo> productos = [];
                                        producto.id = widget.id;
                                        producto.nombre = widget.nombre;
                                        producto.cantidad = cantidad;
                                        producto.precio = precio3;
                                        producto.casa = widget.casa;
                                        producto.tipo = widget.tipo;
                                        producto.descripcion = widget.descripcion;
                                        producto.foto = widget.foto;
                                        productos.add(producto);                         
                                        carrs = await registrarCarrito(globals.usuario, productos);
                                        setState(() {
                                          carrito1 = carrs;
                                        });             
                                    }else{
                                      for(int i=0; i<snapshot2.data.length;i++){
                                        if(snapshot2.data[i].idUsuario == globals.usuario){
                                          List<ProductosModelo> productos = [];
                                          CarritoModelo carr = new CarritoModelo();
                                          ProductosModelo prod = new ProductosModelo();
                                          prod.id = widget.id;
                                          prod.nombre = widget.nombre;
                                          prod.cantidad = cantidad;
                                          prod.precio = precio3;
                                          prod.casa = widget.casa;
                                          prod.tipo = widget.tipo;
                                          prod.descripcion = widget.descripcion;
                                          prod.foto = widget.foto;
                                          for(int n=0; n<snapshot2.data[i].productos.length;n++){
                                            ProductosModelo prod2 = new ProductosModelo();
                                            prod2.id = snapshot2.data[i].productos[n].id;
                                            prod2.nombre = snapshot2.data[i].productos[n].nombre;
                                            prod2.cantidad = snapshot2.data[i].productos[n].cantidad;
                                            prod2.precio = snapshot2.data[i].productos[n].precio;
                                            prod2.casa = snapshot2.data[i].productos[n].casa;
                                            prod2.tipo = snapshot2.data[i].productos[n].tipo;
                                            prod2.descripcion = snapshot2.data[i].productos[n].descripcion;
                                            prod2.foto = snapshot2.data[i].productos[n].foto;
                                            productos.add(prod2);
                                          } 

                                          productos.add(prod);
                                          carr.id = snapshot2.data[i].id;
                                          carr.idUsuario = globals.usuario;
                                          carr.productos = productos;
                                          carrs = await actualizarCarrito(carr);
                                          setState(() {
                                            carrito = carr;
                                          });   
                                        }
                                      }
                                    }
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Tienda2Carrito(),
                                      ));
                                }
                              ),
                            );
                            }
                          ),                        
                        ],
                      ),
                    );
                    }
                  ),
                  SizedBox(height: 84)          
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}