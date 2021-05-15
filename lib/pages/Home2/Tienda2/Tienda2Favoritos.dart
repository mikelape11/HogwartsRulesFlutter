import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/models/ProductosModelo.dart';
import 'package:hogwarts_rules/pages/Home/Home.dart';
import 'package:hogwarts_rules/pages/Home/Tienda/TiendaAPI.dart';

import '../../Ajustes2/Ajustes2.dart';
import '../Home2.dart';
import 'Tienda2Detalles.dart';

class Tienda2Favoritos extends StatefulWidget {
  const Tienda2Favoritos({Key key}) : super(key: key);

  @override
  _Tienda2FavoritosState createState() => _Tienda2FavoritosState();
}

class _Tienda2FavoritosState extends State<Tienda2Favoritos> {
  bool _isVisible = true;

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
                  icon: Icon(Icons.arrow_back, color: Color(globals.color2), size: 25,),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Home2(0),
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
        title: Text('Favoritos', style: TextStyle(color: Color(globals.color2)),),
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
          Center(
            child: FutureBuilder(
              future: getFavoritos(globals.usuario),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(!snapshot.hasData){    
                return Center(child: CircularProgressIndicator(strokeWidth: 2));
              }
              return Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width/1.1,
                height: MediaQuery.of(context).size.height/1.1,
                child: DraggableScrollableSheet(
                  initialChildSize: 1,
                  builder: (context, scrollControler){
                    return GridView.count(
                      primary: false,  
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [  
                        for (var i = 0; i < snapshot.data.length; i++)
                          for(var k=0; k<snapshot.data[i].productos.length;k++)
                            for(var j=0; j<snapshot.data[i].productos[k].foto.length;j++)
                        Visibility(
                          visible: _isVisible,
                          child: FlipCard(
                            direction: FlipDirection.HORIZONTAL,
                            speed: 1000,
                            front: Stack(
                              children: [                          
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color(globals.color1),
                                    border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                                  ),                              
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:  MemoryImage(base64Decode(snapshot.data[i].productos[k].foto[j].thumbUrl.split(',').last)),
                                        fit: BoxFit.fitWidth,  
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      //ICONO PARA IR AL PERFIL DE USUARIO
                                      icon: Icon(
                                        Icons.remove_circle_outline,
                                        color: Color(globals.color2), size: 25,
                                      ),
                                      onPressed: () async{
                                        List<ProductosModelo> prods = new List<ProductosModelo>();
                                        prods.add(snapshot.data[i].productos[k]);
                                        await deleteFavoritos(snapshot.data[i].id, prods);
                                        setState(() {
                                          
                                        });
                                      }),
                                ),
                              ],
                            ), 
                            back: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color(globals.color1),
                                border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Text("${snapshot.data[i].productos[k].nombre}", style: TextStyle(color: Colors.white70),),
                                  ),
                                  Container(
                                    child: Text("${snapshot.data[i].productos[k].precio} €", style: TextStyle(color: Colors.white70),),
                                  ),
                                  Container(
                                    child: RaisedButton(                       
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      color: Color(globals.color4),
                                      child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                      onPressed: () async{
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => Tienda2Detalles(snapshot.data[i].productos[k].id,snapshot.data[i].productos[k].nombre,snapshot.data[i].productos[k].precio,snapshot.data[i].productos[k].cantidad,snapshot.data[i].productos[k].casa,snapshot.data[i].productos[k].descripcion,snapshot.data[i].productos[k].tipo,snapshot.data[i].productos[k].foto, snapshot.data[i].productos[k].foto[j].thumbUrl.split(',').last),
                                        ));
                                      }
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ),
                        ),
                       ],
                    );
                  }
                ),
              );
              }
            )
          )
        ],        
      ),
    );
  }
}