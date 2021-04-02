import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;

class Informacion2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: globals.grySecundario, //change your color here
        ),
        //automaticallyImplyLeading: false,
        title: Text('Informacion', style: TextStyle(color: globals.grySecundario),),
        backgroundColor: globals.gryPrincipal,
        centerTitle: true,
        bottom: PreferredSize(
        child: Container(
          color: globals.grySecundario,
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(4.0)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          image: DecorationImage(
            image:  AssetImage('images/Gryffindor/gryffindor.png'),
            fit: BoxFit.fitWidth,  
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/LOGOS/Logo1.png'),                   
                    )
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 17, color: Colors.white
                      ),
                      children: [
                        TextSpan(text: 'H', style: TextStyle(color: globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 25)),
                        TextSpan(text: 'ogwarts '),
                        TextSpan(text: 'R', style: TextStyle(color: globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 25)),
                        TextSpan(text: 'ules es una aplicación que sirve para saber todas las noticias sobre las películas y libros de Harry Potter, aparte de, tener un test el cual podrás saber a qué casa perteneces, junto con más servicios como un chat, juegos... etc.'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  height: 15,
                  color: globals.grySecundario,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,         
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 19, color: Colors.white
                      ),
                      children: [
                        TextSpan(text: 'E', style: TextStyle(color: globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 25)),
                        TextSpan(text: 'n este apartado podrás realizar una compra de nuestros productos, pero si eres fan de Harry Potter no esperes para pulsar el boton de realizar el test!'),
                      ] 
                    )               
                  )
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            )
          ),
        ),
      )
    );
  }
}