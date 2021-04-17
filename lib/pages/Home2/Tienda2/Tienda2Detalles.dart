import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Ajustes2/Ajustes2.dart';
import 'package:hogwarts_rules/pages/Home/Home.dart';
import 'package:hogwarts_rules/pages/Home2/Tienda2/Tienda2Carrito.dart';
import 'package:hogwarts_rules/pages/Home2/Tienda2/Tienda2Favoritos.dart';
import 'package:hogwarts_rules/pages/Home2/Tienda2/Tienda2Pagar.dart';

class Tienda2Detalles extends StatefulWidget {
  const Tienda2Detalles({Key key}) : super(key: key);

  @override
  _DetallesTiendaState createState() => _DetallesTiendaState();
}

class _DetallesTiendaState extends State<Tienda2Detalles> {
  int cantidad = 0;
  int precio = 0;
  bool fav = false;

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
                    image:  AssetImage('images/Tienda/Jersey.png'),
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
                    child: Text("JERSEY HARRY POTTER", style: TextStyle(color: Color(globals.color2), fontSize: 25))
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Text(
                      "Lorem ipsum dolor sit amet consectetur, adipiscing elit potenti facilisi dignissim lectus, netus nec suspendisse quam. Mauris pretium fringilla hendrerit lacinia ornare velit lectus aliquet varius venenatis.", 
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
                                    if(cantidad > 0)
                                      cantidad--;                                 
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
                                    cantidad++;                              
                                  });
                                }
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Text("${precio} €", style: TextStyle(color: Colors.white70,fontSize: 25))
                      ),
                      SizedBox(width: 90,)
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
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
                                setState(() {
                                  if(fav == false)
                                    fav = true;
                                  else
                                    fav = false;
                                });
                              }
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(                         
                          child: RaisedButton(   
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),  
                            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 30),                     
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            color: Color(globals.color4),
                            child: Text('AÑADIR AL CARRITO', style: TextStyle(color: Color(globals.color2), fontSize: 18),),
                            onPressed: () async{
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Tienda2Pagar(),
                              ));
                            }
                          ),
                        ),                        
                      ],
                    ),
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