import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/models/ProductosModelo.dart';
import 'package:hogwarts_rules/pages/Home/Home.dart';
import 'package:hogwarts_rules/pages/Home/Tienda/TiendaAPI.dart';

import '../../Ajustes2/Ajustes2.dart';
import '../Home2.dart';
import 'Tienda2Pagar.dart';

class Tienda2Carrito extends StatefulWidget {
  const Tienda2Carrito({Key key}) : super(key: key);

  @override
  _Tienda2CarritoState createState() => _Tienda2CarritoState();
}

class _Tienda2CarritoState extends State<Tienda2Carrito> {
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
                      builder: (context) => Home2(),
                    ));
                  }
                ),
              ],
            )
          ),
        ),
        iconTheme: IconThemeData(
          color: Color(globals.color2)
        ),
        title: Text('Carrito', style: TextStyle(color: Color(globals.color2)),),
        backgroundColor: Color(globals.color1),
        centerTitle: true,
        actions: [      
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:  AssetImage('${globals.fondoNegro3}'),
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
                      color: Color(globals.color1),
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
                                icon: Icon(Icons.remove_circle_outline, color: Color(globals.color2), size: 25,),
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
                  Container(    
                    margin: EdgeInsets.symmetric(horizontal: 15),                     
                    child: RaisedButton(   
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),  
                      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 30),                     
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      color: Color(globals.color1),
                      child: Text('TERMINAR COMPRA', style: TextStyle(color: Color(globals.color2), fontSize: 18),),
                      onPressed: () async{
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Tienda2Pagar(),
                        ));
                      }
                    ),
                  ),  
                  SizedBox(height: 25,)
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