import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Home/Home.dart';

import '../../Ajustes2/Ajustes2.dart';

class Tienda2Favoritos extends StatefulWidget {
  const Tienda2Favoritos({Key key}) : super(key: key);

  @override
  _Tienda2FavoritosState createState() => _Tienda2FavoritosState();
}

class _Tienda2FavoritosState extends State<Tienda2Favoritos> {
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
            child: Container(
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
                      FlipCard(
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
                                    image:  AssetImage('images/Varitas/varita1.png'),
                                    fit: BoxFit.fitWidth,  
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                                icon: _iconoFav(), 
                                color: Color(globals.color2),                            
                                onPressed: () {
                                  
                                }
                              ),
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
                                child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: Text("30 €", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: RaisedButton(                       
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  color: Color(globals.color4),
                                  child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                  onPressed: () async{
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //   builder: (context) => DetallesTienda(),
                                    // ));
                                  }
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                      FlipCard(
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
                                    image:  AssetImage('images/Tienda/Jersey.png'),
                                    fit: BoxFit.fitWidth,  
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                                icon: Icon(Icons.favorite, color: Color(globals.color2), size: 25,),
                                onPressed: () {
                                  
                                }
                              ),
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
                                child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: Text("30 €", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: RaisedButton(                       
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  color: Color(globals.color4),
                                  child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                  onPressed: () async{
                                     // Navigator.of(context).push(MaterialPageRoute(
                                    //   builder: (context) => DetallesTienda(),
                                    // ));
                                  }
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                      FlipCard(
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
                                    image:  AssetImage('images/Tienda/Jersey2.png'),
                                    fit: BoxFit.fitWidth,  
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                                icon: Icon(Icons.favorite, color: Color(globals.color2), size: 25,),
                                onPressed: () {
                                  
                                }
                              ),
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
                                child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: Text("30 €", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: RaisedButton(                       
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  color: Color(globals.color4),
                                  child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                  onPressed: () async{
                                     // Navigator.of(context).push(MaterialPageRoute(
                                    //   builder: (context) => DetallesTienda(),
                                    // ));
                                  }
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                      FlipCard(
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
                                    image:  AssetImage('images/Tienda/Funko.png'),
                                    fit: BoxFit.fitWidth,  
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                                icon: Icon(Icons.favorite, color: Color(globals.color2), size: 25,),
                                onPressed: () {
                                  
                                }
                              ),
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
                                child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: Text("30 €", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: RaisedButton(                       
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  color: Color(globals.color4),
                                  child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                  onPressed: () async{
                                     // Navigator.of(context).push(MaterialPageRoute(
                                    //   builder: (context) => DetallesTienda(),
                                    // ));
                                  }
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                      FlipCard(
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
                                    image:  AssetImage('images/Tienda/Bufanda.png'),
                                    fit: BoxFit.fitWidth,  
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                                icon: Icon(Icons.favorite, color: Color(globals.color2), size: 25,),
                                onPressed: () {
                                  
                                }
                              ),
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
                                child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: Text("30 €", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: RaisedButton(                       
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  color: Color(globals.color4),
                                  child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                  onPressed: () async{
                                     // Navigator.of(context).push(MaterialPageRoute(
                                    //   builder: (context) => DetallesTienda(),
                                    // ));
                                  }
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                      FlipCard(
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
                                    image:  AssetImage('images/Tienda/Libro.png'),
                                    fit: BoxFit.fitWidth,  
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                                icon: Icon(Icons.favorite, color: Color(globals.color2), size: 25,),
                                onPressed: () {
                                  
                                }
                              ),
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
                                child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: Text("30 €", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: RaisedButton(                       
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  color: Color(globals.color4),
                                  child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                  onPressed: () async{
                                     // Navigator.of(context).push(MaterialPageRoute(
                                    //   builder: (context) => DetallesTienda(),
                                    // ));
                                  }
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                      FlipCard(
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
                                    image:  AssetImage('images/Tienda/Taza.png'),
                                    fit: BoxFit.fitWidth,  
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                                icon: Icon(Icons.favorite, color: Color(globals.color2), size: 25,),
                                onPressed: () {
                                  
                                }
                              ),
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
                                child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: Text("30 €", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: RaisedButton(                       
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  color: Color(globals.color4),
                                  child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                  onPressed: () async{
                                     // Navigator.of(context).push(MaterialPageRoute(
                                    //   builder: (context) => DetallesTienda(),
                                    // ));
                                  }
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                      FlipCard(
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
                                    image:  AssetImage('images/Tienda/Niki.png'),
                                    fit: BoxFit.fitWidth,  
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                                icon: Icon(Icons.favorite, color: Color(globals.color2), size: 25,),
                                onPressed: () {
                                  
                                }
                              ),
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
                                child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: Text("30 €", style: TextStyle(color: Colors.white70),),
                              ),
                              Container(
                                child: RaisedButton(                       
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  color: Color(globals.color4),
                                  child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                  onPressed: () async{
                                     // Navigator.of(context).push(MaterialPageRoute(
                                    //   builder: (context) => DetallesTienda(),
                                    // ));
                                  }
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                    ],
                  );
                }
              ),
            ),
          )
        ],        
      ),
    );
  }
}