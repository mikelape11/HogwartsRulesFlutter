import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Ajustes/Ajustes.dart';
import 'package:hogwarts_rules/pages/Home/Home.dart';
import 'package:hogwarts_rules/pages/Home/Tienda/TiendaPagar.dart';
import 'package:hogwarts_rules/models/CarritoModelo.dart';
import 'TiendaAPI.dart';
import 'dart:convert';
import 'package:hogwarts_rules/models/ProductosModelo.dart';

class CarritoTienda extends StatefulWidget {
  const CarritoTienda({Key key}) : super(key: key);

  @override
  _CarritoTiendaState createState() => _CarritoTiendaState();
}

class _CarritoTiendaState extends State<CarritoTienda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: Center(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Stack(
              children: <Widget>[
                IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                  icon: Icon(Icons.arrow_back, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 25,),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Home(0),
                    ));
                  }
                ),
              ],
            )
          ),
        ),
        iconTheme: IconThemeData(
          color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario//change your color here
        ),
        title: Text('Carrito', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
        backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
        centerTitle: true,
        actions: [      
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoHuf}') :  AssetImage('${globals.fondoGry}'),
                fit: BoxFit.fitWidth,  
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          FutureBuilder(
            future: getCarrito(globals.usuario),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(!snapshot.hasData){    
              return Center(child: CircularProgressIndicator(strokeWidth: 2));
            }
            return Container(
              child: ListView(
                children: [
                  SizedBox(height: 10,),
                  for (var i = 0; i < snapshot.data.length; i++)
                    for(var k=0; k<snapshot.data[i].productos.length;k++)
                      for(var j=0; j<snapshot.data[i].productos[k].foto.length;j++)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 30,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withRed(80),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: MemoryImage(base64Decode(snapshot.data[i].productos[k].foto[j].thumbUrl.split(',').last)),
                                  fit: BoxFit.fitHeight,  
                                ),
                              ),
                              //color: Colors.red,
                              height: 70,
                              width: MediaQuery.of(context).size.width/4,
                            ),
                            Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width/2.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Text("${snapshot.data[i].productos[k].nombre}", style: TextStyle(fontSize: 17, color: Colors.white70, fontWeight: FontWeight.bold),),
                                  ),
                                  SizedBox(height: 15,),
                                  Container(
                                    child: Text("${snapshot.data[i].productos[k].precio} €", style: TextStyle(fontSize: 17, color: Colors.white70, fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: MediaQuery.of(context).size.width/7,
                              child: Text("${snapshot.data[i].productos[k].cantidad}", style: TextStyle(fontSize: 20, color: Colors.white70, fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              child: IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                                icon: Icon(Icons.remove_circle_outline, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 25,),
                                onPressed: () async {
                                  List<ProductosModelo> prods = new List<ProductosModelo>();
                                  prods.add(snapshot.data[i].productos[k]);
                                  await deleteCarrito(snapshot.data[i].id, prods);
                                  setState(() {
                                    
                                  });
                                }
                              ),
                            ),
                          ],
                        ),                    
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  FutureBuilder(
                    future: getCarrito(globals.usuario),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if(!snapshot.hasData){    
                      return Center(child: CircularProgressIndicator(strokeWidth: 2));
                    } 
                    return Container(    
                      margin: EdgeInsets.symmetric(horizontal: 15),                     
                      child: RaisedButton(   
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),  
                        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 30),                     
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withRed(100),
                        child: Text('TERMINAR COMPRA', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontSize: 18),),
                        onPressed: () async{
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TiendaPagar(snapshot),
                                ));
                        }
                      ),
                    );
                    }
                  ),
                  SizedBox(height: 25,),  
                ],          
              ),
            );
            }
          ),
        ],                         
      ),
    );
  }
}