import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Home/Games/GamesGuessWho.dart';
import 'package:hogwarts_rules/pages/Home/Games/GamesSnitch.dart';


class Games extends StatelessWidget {
  const Games({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.25,
      child: ListView(
        children: [
          SizedBox(height: 10,),
          // for(var i=0; i<4; i++)
          FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 1000,
            front: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withRed(80),
                child: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [    
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 170,
                        width: MediaQuery.of(context).size.width/2.5,
                        child: Center(child: Text('A QUIÉN TE PARECES', style: TextStyle(fontSize: 25, color: Colors.white70, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width/2.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            //image: AssetImage('${widget.snapshot.data[i].avatar}'),
                            image: AssetImage("images/guesswho.png"),
                            fit: BoxFit.fitWidth,  
                          ),
                        ),
                      ),              
                    ],
                  ),                    
                ),
              ),
            ),
            back: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withRed(80),
                child: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [    
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Text('Introduce una imagen tuya y mira a que personaje de harry potter te pareces!', style: TextStyle(fontSize: 18, color: Colors.white70, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
                      ),
                      SizedBox(height: 25,),
                      Container(
                        child: RaisedButton(                       
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
                          child: Text('JUGAR', style: TextStyle(color: Colors.white70, fontSize: 18),),
                          onPressed: () {       
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => GamesGuessWho(),
                            ));
                          }
                        ),
                      ),              
                    ],
                  ),                    
                ),
              ),
            ),
          ),      
          FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 1000,
            front: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withRed(80),
                child: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [    
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 170,
                        width: MediaQuery.of(context).size.width/2.5,
                        child: Center(child: Text('ATRAPA LA SNITCH', style: TextStyle(fontSize: 25, color: Colors.white70, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width/2.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            //image: AssetImage('${widget.snapshot.data[i].avatar}'),
                            image: AssetImage("images/snitch.png"),
                            fit: BoxFit.fitWidth,  
                          ),
                        ),
                      ),              
                    ],
                  ),                    
                ),
              ),
            ),
            back: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withRed(80),
                child: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [    
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Text('Atrapa la Snitch y consigue los maximos puntos que puedas!', style: TextStyle(fontSize: 18, color: Colors.white70, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
                      ),
                      SizedBox(height: 25,),
                      Container(
                        child: RaisedButton(                       
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
                          child: Text('JUGAR', style: TextStyle(color: Colors.white70, fontSize: 18),),
                          onPressed: () {       
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => GamesSnitch(),
                            ));
                          }
                        ),
                      ),              
                    ],
                  ),                    
                ),
              ),
            ),
          ),  
          for(var i=0; i<2; i++)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Card(
              elevation: 30,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withRed(80),
              child: Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [    
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 170,
                      width: MediaQuery.of(context).size.width/2.2,
                      child: Center(child: Text('PROXIMAMENTE', style: TextStyle(fontSize: 22, color: Colors.white70, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      height: 170,
                      width: MediaQuery.of(context).size.width/2.8,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          //image: AssetImage('${widget.snapshot.data[i].avatar}'),
                          image: AssetImage("images/interrogacion.png"),
                          fit: BoxFit.fitWidth,  
                        ),
                      ),
                    ),              
                  ],
                ),                    
              ),
            ),
          ),      
        ],          
      ),          
    );
  }
}