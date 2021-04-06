import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Home/Home.dart';

class CarritoTienda extends StatelessWidget {
  const CarritoTienda({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: globals.grySecundario//change your color here
        ),
        title: Text('Carrito', style: TextStyle(color: globals.grySecundario),),
        backgroundColor: globals.gryPrincipal,
        centerTitle: true,
        actions: [      
          IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(Icons.settings_outlined, color: globals.grySecundario, size: 25,),
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => Ajustes2(),
              // ));
            }
          ),
        ],
        bottom: PreferredSize(
        child: Container(
          color: globals.grySecundario,
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(4.0)),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:  AssetImage('images/Gryffindor/gryffindor.png'),
              fit: BoxFit.fitWidth,  
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  elevation: 30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  color: globals.gryPrincipal.withRed(80),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:  AssetImage('images/Tienda/Jersey.png'),
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
                                child: Text("Jersey Harry Potter", style: TextStyle(fontSize: 17, color: Colors.white70, fontWeight: FontWeight.bold),),
                              ),
                              SizedBox(height: 15,),
                              Container(
                                child: Text("30€", style: TextStyle(fontSize: 17, color: Colors.white70, fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width/7,
                          child: Text("1", style: TextStyle(fontSize: 20, color: Colors.white70, fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          child: IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                            icon: Icon(Icons.remove_circle_outline, color: globals.grySecundario, size: 25,),
                            onPressed: () {
                              
                            }
                          ),
                        ),
                      ],
                    ),                    
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  elevation: 30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  color: globals.gryPrincipal.withRed(80),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:  AssetImage('images/Tienda/Bufanda.png'),
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
                                child: Text("Bufanda", style: TextStyle(fontSize: 17, color: Colors.white70, fontWeight: FontWeight.bold),),
                              ),
                              SizedBox(height: 15,),
                              Container(
                                child: Text("50€", style: TextStyle(fontSize: 17, color: Colors.white70, fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width/7,
                          child: Text("2", style: TextStyle(fontSize: 20, color: Colors.white70, fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          child: IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                            icon: Icon(Icons.remove_circle_outline, color: globals.grySecundario, size: 25,),
                            onPressed: () {
                              
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
                  color: globals.gryPrincipal.withRed(100),
                  child: Text('TERMINAR COMPRA', style: TextStyle(color: globals.grySecundario, fontSize: 18),),
                  onPressed: () async{
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Home(0),
                    ));
                  }
                ),
              ),  
            ],          
          ),
        ),
      ),
    );
  }
}