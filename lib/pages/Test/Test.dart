import 'package:flutter/material.dart';
import 'package:hogwarts_rules/models/EleccionCasaModelo.dart';
import 'package:hogwarts_rules/models/UsuarioModelo.dart';
import 'package:hogwarts_rules/pages/Home/Home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'dart:math';
import 'TestAPI.dart';
import 'package:dart_random_choice/dart_random_choice.dart';


class Test extends StatefulWidget {
  final AsyncSnapshot snapshot;

  Test(this.snapshot);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> opacidad;

  @override
  void initState() {

    controller = new AnimationController ( vsync: this, duration: Duration(milliseconds: 2000));
    opacidad = new Tween(begin: 0.0, end: 1.0).animate(controller);

    controller.forward();
    super.initState();
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  PageController _pageController = new PageController();
  EleccionCasaModelo eleccion;
  UsuarioModelo usuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: geteleccionCasaTodos(),
              builder: (BuildContext context, AsyncSnapshot snapshot2) {
                if(!snapshot2.hasData){    
                  return Center(child: CircularProgressIndicator(strokeWidth: 2));
                }else{ 
                for(int i=0; i<snapshot2.data.length; i++){
                  if(snapshot2.data[i].idUsuario == globals.usuario){
                    globals.idEleccionCasa = snapshot2.data[i].id;
                    globals.puntosGry = snapshot2.data[i].puntosGry;
                    globals.puntosSly = snapshot2.data[i].puntosSly;
                    globals.puntosHuff = snapshot2.data[i].puntosHuff;
                    globals.puntosRav = snapshot2.data[i].puntosRav;
                  }
                }
              }
            return Container(
              decoration: BoxDecoration(
                color: Colors.black87,
                image: DecorationImage(
                  image:  AssetImage('images/fondoNegro.png'),
                  fit: BoxFit.fitWidth,  
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            );
            }
          ),
          
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: [
              for(var i=0; i<widget.snapshot.data.length; i++)
                FadeTransition(
                  opacity: opacidad,
                   child: Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 270,
                          child: Center(child: Text("${i+1}", style: TextStyle(fontSize: 200, color: Colors.white70)))
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Text(
                              "${widget.snapshot.data[i].pregunta}", 
                              style: TextStyle(color: Colors.white, fontSize: 22),
                            )
                          )
                        ),
                        SizedBox(height: 10,),
                        if(i%2!=0)
                          for(var j=0; j<widget.snapshot.data[i].respuestas.length; j++)
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width/1.2,
                              child: Center(
                                child: RaisedButton(
                                  color: Colors.white38,
                                  child: Text("${widget.snapshot.data[i].respuestas[j].respuesta}"),
                                  // shape: RoundedRectangleBorder(
                                  //   side: BorderSide(color: Colors.white, width: 2,)
                                  // ),
                                  onPressed: () async{
                                    if(widget.snapshot.data[i].respuestas[j].puntos == "a"){
                                  EleccionCasaModelo nuevo = new EleccionCasaModelo();
                                  nuevo.id = globals.idEleccionCasa;
                                  nuevo.idUsuario = globals.usuario;
                                  nuevo.puntosGry = globals.puntosGry + 1;
                                  nuevo.puntosSly = globals.puntosSly;
                                  nuevo.puntosHuff = globals.puntosHuff;
                                  nuevo.puntosRav = globals.puntosRav;
                                  EleccionCasaModelo puntos = await actualizarPuntos(nuevo);   
                                  setState(() {
                                    eleccion = puntos;
                                  });  
                                }else if(widget.snapshot.data[i].respuestas[j].puntos == "b"){
                                  EleccionCasaModelo nuevo = new EleccionCasaModelo();
                                  nuevo.id = globals.idEleccionCasa;
                                  nuevo.idUsuario = globals.usuario;
                                  nuevo.puntosSly = globals.puntosSly + 1;
                                  nuevo.puntosGry = globals.puntosGry;
                                  nuevo.puntosHuff = globals.puntosHuff;
                                  nuevo.puntosRav = globals.puntosRav;
                                  EleccionCasaModelo puntos = await actualizarPuntos(nuevo);   
                                  setState(() {
                                    eleccion = puntos;
                                  });  
                                }else if(widget.snapshot.data[i].respuestas[j].puntos == "c"){
                                  EleccionCasaModelo nuevo = new EleccionCasaModelo();
                                  nuevo.id = globals.idEleccionCasa;
                                  nuevo.idUsuario = globals.usuario;
                                  nuevo.puntosRav = globals.puntosRav + 1;
                                  nuevo.puntosGry = globals.puntosGry;
                                  nuevo.puntosHuff = globals.puntosHuff;
                                  nuevo.puntosSly = globals.puntosSly;
                                  EleccionCasaModelo puntos = await actualizarPuntos(nuevo);   
                                  setState(() {
                                    eleccion = puntos;
                                  });  
                                }else if(widget.snapshot.data[i].respuestas[j].puntos == "d"){
                                  EleccionCasaModelo nuevo = new EleccionCasaModelo();
                                  nuevo.id = globals.idEleccionCasa;
                                  nuevo.idUsuario = globals.usuario;
                                  nuevo.puntosHuff = globals.puntosHuff + 1;
                                  nuevo.puntosGry = globals.puntosGry;
                                  nuevo.puntosRav = globals.puntosRav;
                                  nuevo.puntosSly = globals.puntosSly;
                                  EleccionCasaModelo puntos = await actualizarPuntos(nuevo);   
                                  setState(() {
                                    eleccion = puntos;
                                  });  
                                }
                                    if(i==7){
                                      var result = [globals.puntosGry,globals.puntosSly,globals.puntosRav,globals.puntosHuff].reduce(max);
                                      //var el = randomChoice(result);
                                      if(result == globals.puntosGry && result == globals.puntosSly && result == globals.puntosRav && result == globals.puntosHuff){
                                        var lista = ["Gryffindor","Slytherin","Ravenclaw","Hufflepuff"];
                                        var el = randomChoice(lista);
                                        UsuarioModelo nuevo = new UsuarioModelo();
                                        nuevo.usuario = globals.usuario;
                                        nuevo.casaHogwarts = el;
                                        UsuarioModelo usu = await actualiziarCasaHogwarts(nuevo); 
                                        globals.casaHogwarts = el;
                                        setState(() {
                                          usuario = usu;
                                        }); 
                                      }else if(result == globals.puntosGry){
                                        UsuarioModelo nuevo = new UsuarioModelo();
                                        nuevo.usuario = globals.usuario;
                                        nuevo.casaHogwarts = "Gryffindor";
                                        UsuarioModelo usu = await actualiziarCasaHogwarts(nuevo); 
                                        globals.casaHogwarts = "Gryffindor";
                                        setState(() {
                                          usuario = usu;
                                        }); 
                                      }else if(result == globals.puntosSly){
                                        UsuarioModelo nuevo = new UsuarioModelo();
                                        nuevo.usuario = globals.usuario;
                                        nuevo.casaHogwarts = "Slytherin";
                                        UsuarioModelo usu = await actualiziarCasaHogwarts(nuevo); 
                                        globals.casaHogwarts = "Slytherin";
                                        setState(() {
                                          usuario = usu;
                                        }); 
                                      }else if(result == globals.puntosRav){
                                        UsuarioModelo nuevo = new UsuarioModelo();
                                        nuevo.usuario = globals.usuario;
                                        nuevo.casaHogwarts = "Ravenclaw";
                                        UsuarioModelo usu = await actualiziarCasaHogwarts(nuevo); 
                                        globals.casaHogwarts = "Ravenclaw";
                                        setState(() {
                                          usuario = usu;
                                        }); 
                                      }else if(result == globals.puntosHuff){
                                        UsuarioModelo nuevo = new UsuarioModelo();
                                        nuevo.usuario = globals.usuario;
                                        nuevo.casaHogwarts = "Hufflepuff";
                                        UsuarioModelo usu = await actualiziarCasaHogwarts(nuevo); 
                                        globals.casaHogwarts = "Hufflepuff";
                                        setState(() {
                                          usuario = usu;
                                        }); 
                                      }
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Home(0),
                                      ));
                                    }else{
                                      _pageController.animateToPage(
                                        i+1,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      ); 
                                    }
                                  },          
                                )
                              )
                            ),
                          )
                        else
                        GridView.count(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          childAspectRatio: 1.4,
                          children: [
                          for(var j=0; j<widget.snapshot.data[i].respuestas.length; j++)
                            for(var n=0; n<widget.snapshot.data[i].respuestas[j].imagen.length; n++)
                            GestureDetector(
                              child: Container(
                                margin: EdgeInsets.all(4),
                                height: 10,
                                width: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: widget.snapshot.data[i].respuestas[j].imagen[n].name == "" ?  AssetImage('images/LOGOS/Logo1.png') : AssetImage('${widget.snapshot.data[i].respuestas[j].imagen[n].name}'),
                                    fit: BoxFit.fill,
                                  ),
                                  //shape: BoxShape.circle, 
                                ),                     
                               ),
                              onTap: () async{
                                if(widget.snapshot.data[i].respuestas[j].puntos == "a"){
                                  EleccionCasaModelo nuevo = new EleccionCasaModelo();
                                  nuevo.id = globals.idEleccionCasa;
                                  nuevo.idUsuario = globals.usuario;
                                  nuevo.puntosGry = globals.puntosGry + 1;
                                  nuevo.puntosSly = globals.puntosSly;
                                  nuevo.puntosHuff = globals.puntosHuff;
                                  nuevo.puntosRav = globals.puntosRav;
                                  EleccionCasaModelo puntos = await actualizarPuntos(nuevo);   
                                  setState(() {
                                    eleccion = puntos;
                                  });  
                                }else if(widget.snapshot.data[i].respuestas[j].puntos == "b"){
                                  EleccionCasaModelo nuevo = new EleccionCasaModelo();
                                  nuevo.id = globals.idEleccionCasa;
                                  nuevo.idUsuario = globals.usuario;
                                  nuevo.puntosSly = globals.puntosSly + 1;
                                  nuevo.puntosGry = globals.puntosGry;
                                  nuevo.puntosHuff = globals.puntosHuff;
                                  nuevo.puntosRav = globals.puntosRav;
                                  EleccionCasaModelo puntos = await actualizarPuntos(nuevo);   
                                  setState(() {
                                    eleccion = puntos;
                                  });  
                                }else if(widget.snapshot.data[i].respuestas[j].puntos == "c"){
                                  EleccionCasaModelo nuevo = new EleccionCasaModelo();
                                  nuevo.id = globals.idEleccionCasa;
                                  nuevo.idUsuario = globals.usuario;
                                  nuevo.puntosRav = globals.puntosRav + 1;
                                  nuevo.puntosGry = globals.puntosGry;
                                  nuevo.puntosHuff = globals.puntosHuff;
                                  nuevo.puntosSly = globals.puntosSly;
                                  EleccionCasaModelo puntos = await actualizarPuntos(nuevo);   
                                  setState(() {
                                    eleccion = puntos;
                                  });  
                                }else if(widget.snapshot.data[i].respuestas[j].puntos == "d"){
                                  EleccionCasaModelo nuevo = new EleccionCasaModelo();
                                  nuevo.id = globals.idEleccionCasa;
                                  nuevo.idUsuario = globals.usuario;
                                  nuevo.puntosHuff = globals.puntosHuff + 1;
                                  nuevo.puntosGry = globals.puntosGry;
                                  nuevo.puntosRav = globals.puntosRav;
                                  nuevo.puntosSly = globals.puntosSly;
                                  EleccionCasaModelo puntos = await actualizarPuntos(nuevo);   
                                  setState(() {
                                    eleccion = puntos;
                                  });  
                                }
                                if(i==7){
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Home(0),
                                  ));
                                }else{
                                  _pageController.animateToPage(
                                    i+1,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  ); 
                                }
                              },      
                            ),               
                          ],
                        )
                      ]
                    ),
                  ),
                  
                ),
               
              ],
            ),
            
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.1),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: widget.snapshot.data.length,
                    effect: WormEffect(
                      dotColor: Colors.grey[900],
                      activeDotColor: Colors.white
                    ),
                  )
                ),
              )
            ]
          ),
          SizedBox(height: 100),
          Container(
            height: 10,
          )   
        ]
      ),
    );
  }
}