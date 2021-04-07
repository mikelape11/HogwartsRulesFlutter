import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/models/EleccionCasaModelo.dart';
import 'package:hogwarts_rules/pages/Test/PortadaTest.dart';
import 'package:hogwarts_rules/pages/Test/TestAPI.dart';


class Home2Portada extends StatefulWidget {
  const Home2Portada({Key key}) : super(key: key);

  @override
  _Home2PortadaState createState() => _Home2PortadaState();
}

class _Home2PortadaState extends State<Home2Portada> with SingleTickerProviderStateMixin{
  EleccionCasaModelo eleccion;

  @override
  Widget build(BuildContext context) {
     return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 45),
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
                    TextSpan(text: 'H', style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 25)),
                    TextSpan(text: 'ogwarts '),
                    TextSpan(text: 'R', style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 25)),
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
              color: Color(globals.color2),
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
                    TextSpan(text: 'E', style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 25)),
                    TextSpan(text: 'n este apartado podrás realizar una compra de nuestros productos, pero si eres fan de Harry Potter no esperes para pulsar el boton de realizar el test!'),
                  ] 
                )               
              )
            ),
            SizedBox(
              height: 50,
            ),
            FutureBuilder(
              future: getTest(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              width: 200,
              decoration: BoxDecoration(
                color: Color(globals.color2).withOpacity(0.7),
                border: Border.all(color: Color(globals.color2), width: 2.0),      
              ),
              child: RaisedButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: Colors.transparent,
                child: Text('REALIZAR TEST', style: TextStyle(color: Colors.white, fontSize: 20),),
                onPressed: () async{
                    EleccionCasaModelo puntos = await registrarEleccionCasa(globals.usuario, 0, 0,0,0);            
                    setState(() {
                      eleccion = puntos;
                    });
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PortadaTest(snapshot),
                  ));
                }
              ),
            );
              }
            )
          ]
        ),
      )
    );
  }
}