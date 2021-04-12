import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/models/OpinionModelo.dart';
import 'package:hogwarts_rules/pages/Ajustes/Ajustes.dart';
import 'package:hogwarts_rules/pages/Ajustes/OpinionAPI.dart';



class OpinionesInfo extends StatefulWidget {
  final AsyncSnapshot snapshot;

  OpinionesInfo(this.snapshot);

  @override
  _OpinionesInfoState createState() => _OpinionesInfoState();
}
OpinionModelo opinion;

class _OpinionesInfoState extends State<OpinionesInfo> {

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
                      builder: (context) => Ajustes(),
                    ));
                  }
                ),
              ],
            )
          ),
        ),
        title: Text('Opiniones', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
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
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: ListView(
              children: [
                SizedBox(height: 10,),
                for(int i=0; i<widget.snapshot.data.length; i++)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    elevation: 30,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withRed(80),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:  AssetImage('${widget.snapshot.data[i].avatar}'),
                                    fit: BoxFit.fitHeight,  
                                  ),
                                ),
                                height: 70,
                                width: MediaQuery.of(context).size.width/4,
                              ),
                              Container(
                                child: Text("${widget.snapshot.data[i].usuario}", style: TextStyle(fontSize: 14, color: Colors.white70, fontWeight: FontWeight.bold),),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: RatingBar.builder(
                                  initialRating: widget.snapshot.data[i].puntuacion,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  unratedColor: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario.withOpacity(0.3) : globals.casaHogwarts == "Slytherin" ? globals.slySecundario.withOpacity(0.3) : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario.withOpacity(0.3) : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario.withOpacity(0.3) : globals.grySecundario.withOpacity(0.3),
                                  itemCount: 5,
                                  itemSize: 12.0,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            width: MediaQuery.of(context).size.width/1.5,
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text("${widget.snapshot.data[i].valoracion}", style: TextStyle(fontSize: 17, color: Colors.white70, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                                ),                 
                              ],
                            ),
                          ),                     
                        ],
                      ),                    
                    ),
                  ),
                ),   
              ],          
            ),
          ),
        ]
      ),
    );
  }
}