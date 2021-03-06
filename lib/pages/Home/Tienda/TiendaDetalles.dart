import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Ajustes/Ajustes.dart';
import 'package:hogwarts_rules/pages/Home/Tienda/TiendaCarrito.dart';
import 'package:hogwarts_rules/pages/Home/Tienda/TiendaFavoritos.dart';
import 'dart:convert';

import '../../../models/CarritoModelo.dart';
import '../../../models/FavoritosModelo.dart';
import '../../../models/ImagenRespuestasModelo.dart';
import '../../../models/ProductosModelo.dart';
import 'TiendaAPI.dart';

class DetallesTienda extends StatefulWidget {
  final String id;
  final String nombre;
  final int precio;
  final int cantidad;
  final String casa;
  final String tipo;
  final String descripcion;
  final List<imagenRespuestasModelo> foto;
  final String thumbUrl;

  DetallesTienda(this.id,this.nombre,this.precio,this.cantidad,this.casa,this.tipo,this.descripcion,this.foto,this.thumbUrl);

  @override
  _DetallesTiendaState createState() => _DetallesTiendaState();
}


class _DetallesTiendaState extends State<DetallesTienda> {
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
          color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario//change your color here
        ),
        title: Text('Home', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
        backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
        centerTitle: true,
        actions: [      
          IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(Icons.favorite_outline, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 25,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TiendaFavoritos(),
              ));
            }
          ),
          IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(Icons.shopping_cart_outlined, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 25,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CarritoTienda(),
              ));
            }
          ),  
          IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(Icons.settings_outlined, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 25,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Ajustes(),
              ));
            }
          ),
        ],
        bottom: PreferredSize(
        child: Container(
          color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(4.0)),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoHuf}') :  AssetImage('${globals.fondoGry}'),
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
                //color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,,
                border: Border(bottom: BorderSide(width: 2.0, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario)),
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
                color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
                //border: Border(bottom: BorderSide(width: 2.0, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario)),
              ),
              width: MediaQuery.of(context).size.width,
              height: 371,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Container(
                    child: Text("${widget.nombre}", style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontSize: 25))
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
                                icon: Icon(Icons.remove_circle_outline, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 25,),
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
                                icon: Icon(Icons.add_circle_outline, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 25,),
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
                        child: Text("${precio3} ???", style: TextStyle(color: Colors.white70,fontSize: 25))
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
                              color: Colors.transparent,
                              child: IconButton(
                                icon: _iconoFav(), 
                                disabledColor: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
                                iconSize: 30,
                              ),
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
                                color: Colors.transparent,
                                child: Text('A??ADIR AL CARRITO', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontSize: 18),),
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
                                          for(int j=0;j<snapshot2.data[i].productos.length;j++){
                                            if(snapshot2.data[i].productos[j].id == widget.id){
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
                                            }else{
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
                                        
                                      }
                                    }
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CarritoTienda(),
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
                  SizedBox(height: 80,)          
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}