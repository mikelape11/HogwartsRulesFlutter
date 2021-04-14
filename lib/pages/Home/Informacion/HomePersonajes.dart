import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/widgets/custom_alert_dialog.dart';
import 'package:flip_card/flip_card.dart';

class HomePersonajes extends StatelessWidget {
  const HomePersonajes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.12,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              child: Text(
                'Personajes', 
                style: TextStyle(
                  fontFamily: 'BluuNext', fontSize: 45, color: Colors.white
                ),
              )
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/3.2,
                      height: 250,
                      decoration: BoxDecoration(
                        // color: Colors.black87,
                        image: DecorationImage(
                          image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoPersonajeGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoPersonajeSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoPersonajeRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoPersonajeHuf}') :  AssetImage('${globals.fondoPersonajeGry}'),
                          fit: BoxFit.fill,  
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.06),
                        width: MediaQuery.of(context).size.width/3.2,
                        child: Center(
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.personajeGry3}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.personajeSly3}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.personajeRav3}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.personajeHuf3}') :  AssetImage('${globals.personajeGry3}'),                   
                              )
                            ),
                          ),
                        ),
                      ),
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomAlertDialog(
                              titlePadding: EdgeInsets.all(0.0),
                              contentPadding: EdgeInsets.all(0.0),
                              content: FlipCard(
                                direction: FlipDirection.HORIZONTAL,
                                speed: 1000,
                                front: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        // color: Colors.black87,
                                        image: DecorationImage(
                                          image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoPersonajeGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoPersonajeSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoPersonajeRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoPersonajeHuf}') :  AssetImage('${globals.fondoPersonajeGry}'),
                                          fit: BoxFit.fill,  
                                        ),
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      width: 302,
                                      height: 431,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.personajeGry3}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.personajeSly3}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.personajeRav3}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.personajeHuf3}') :  AssetImage('${globals.personajeGry3}'),
                                        ),
                                      ),
                                      width: 302,
                                      height: 431,
                                    ),
                                  ],
                                ),
                                back: Container(
                                  decoration: BoxDecoration(
                                    // color: Colors.black87,
                                    image: DecorationImage(
                                      image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoPersonajeGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoPersonajeSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoPersonajeRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoPersonajeHuf}') :  AssetImage('${globals.fondoPersonajeGry}'),
                                      fit: BoxFit.fill,  
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      globals.casaHogwarts == "Gryffindor" ? globals.infoPersonajeGry3 : globals.casaHogwarts == "Slytherin" ? globals.infoPersonajeSly3 : globals.casaHogwarts == "Ravenclaw" ? globals.infoPersonajeRav3 : globals.casaHogwarts == "Hufflepuff" ? globals.infoPersonajeHuf3 : "",
                                      style: TextStyle(fontFamily: 'BluuNext', fontSize: 15, color: Colors.white),),
                                  ),
                                  width: 302,
                                  height: 431,
                                ),
                              ),          
                            );
                          }
                        );
                      },
                    ),
                  ],                 
                ),
                SizedBox(width: 6),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/3.2,
                      height: 250,
                      decoration: BoxDecoration(
                        // color: Colors.black87,
                        image: DecorationImage(
                          image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoPersonajeGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoPersonajeSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoPersonajeRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoPersonajeHuf}') :  AssetImage('${globals.fondoPersonajeGry}'),
                          fit: BoxFit.fill,  
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.06),
                        width: MediaQuery.of(context).size.width/3.2,
                        child: Center(
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.personajeGry1}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.personajeSly1}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.personajeRav1}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.personajeHuf1}') :  AssetImage('${globals.personajeGry1}'),                   
                              )
                            ),
                          ),
                        ),
                      ),
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomAlertDialog(
                              titlePadding: EdgeInsets.all(0.0),
                              contentPadding: EdgeInsets.all(0.0),
                              content: FlipCard(
                                direction: FlipDirection.HORIZONTAL,
                                speed: 1000,
                                front: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        // color: Colors.black87,
                                        image: DecorationImage(
                                          image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoPersonajeGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoPersonajeSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoPersonajeRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoPersonajeHuf}') :  AssetImage('${globals.fondoPersonajeGry}'),
                                          fit: BoxFit.fill,  
                                        ),
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      width: 302,
                                      height: 431,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.personajeGry1}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.personajeSly1}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.personajeRav1}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.personajeHuf1}') :  AssetImage('${globals.personajeGry1}'),
                                        ),
                                      ),
                                      width: 302,
                                      height: 431,
                                    ),
                                  ],
                                ),
                                back: Container(
                                  decoration: BoxDecoration(
                                    // color: Colors.black87,
                                    image: DecorationImage(
                                      image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoPersonajeGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoPersonajeSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoPersonajeRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoPersonajeHuf}') :  AssetImage('${globals.fondoPersonajeGry}'),
                                      fit: BoxFit.fill,  
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      globals.casaHogwarts == "Gryffindor" ? globals.infoPersonajeGry1 : globals.casaHogwarts == "Slytherin" ? globals.infoPersonajeSly1 : globals.casaHogwarts == "Ravenclaw" ? globals.infoPersonajeRav1 : globals.casaHogwarts == "Hufflepuff" ? globals.infoPersonajeHuf1 : "",
                                      style: TextStyle(fontFamily: 'BluuNext', fontSize: 15, color: Colors.white),),
                                  ),
                                  width: 302,
                                  height: 431,
                                ),
                              ),          
                            );
                          }
                        );
                      },
                    ),
                  ],                 
                ),
                SizedBox(width: 6),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/3.2,
                      height: 250,
                      decoration: BoxDecoration(
                        // color: Colors.black87,
                        image: DecorationImage(
                          image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoPersonajeGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoPersonajeSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoPersonajeRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoPersonajeHuf}') :  AssetImage('${globals.fondoPersonajeGry}'),
                          fit: BoxFit.fill,  
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.06),
                        width: MediaQuery.of(context).size.width/3.2,
                        child: Center(
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.personajeGry2}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.personajeSly2}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.personajeRav2}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.personajeHuf2}') :  AssetImage('${globals.personajeGry2}'),                   
                              )
                            ),
                          ),
                        ),
                      ),
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomAlertDialog(
                              titlePadding: EdgeInsets.all(0.0),
                              contentPadding: EdgeInsets.all(0.0),
                              content: FlipCard(
                                direction: FlipDirection.HORIZONTAL,
                                speed: 1000,
                                front: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        // color: Colors.black87,
                                        image: DecorationImage(
                                          image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoPersonajeGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoPersonajeSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoPersonajeRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoPersonajeHuf}') :  AssetImage('${globals.fondoPersonajeGry}'),
                                          fit: BoxFit.fill,  
                                        ),
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      width: 302,
                                      height: 431,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.personajeGry2}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.personajeSly2}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.personajeRav2}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.personajeHuf2}') :  AssetImage('${globals.personajeGry2}'),
                                        ),
                                      ),
                                      width: 302,
                                      height: 431,
                                    ),
                                  ],
                                ),
                                back: Container(
                                  decoration: BoxDecoration(
                                    // color: Colors.black87,
                                    image: DecorationImage(
                                      image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoPersonajeGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoPersonajeSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoPersonajeRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoPersonajeHuf}') :  AssetImage('${globals.fondoPersonajeGry}'),
                                      fit: BoxFit.fill,  
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      globals.casaHogwarts == "Gryffindor" ? globals.infoPersonajeGry2 : globals.casaHogwarts == "Slytherin" ? globals.infoPersonajeSly2 : globals.casaHogwarts == "Ravenclaw" ? globals.infoPersonajeRav2 : globals.casaHogwarts == "Hufflepuff" ? globals.infoPersonajeHuf2 : "",
                                      style: TextStyle(fontFamily: 'BluuNext', fontSize: 15, color: Colors.white),),
                                  ),
                                  width: 302,
                                  height: 431,
                                ),
                              ),          
                            );
                          }
                        );
                      },
                    ),
                  ],                 
                ),
              ],
            ),
            SizedBox(height: 15,),
            Container(
              //color: Colors.white.withOpacity(0.05),
              height: 170,
              width: MediaQuery.of(context).size.width/1.08,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text( globals.casaHogwarts == "Gryffindor" ? globals.infoGry : globals.casaHogwarts == "Slytherin" ? globals.infoSly : globals.casaHogwarts == "Ravenclaw" ? globals.infoRav : globals.casaHogwarts == "Hufflepuff" ? globals.infoHuf : "", style: TextStyle(color: Colors.white, fontFamily: 'BluuNext', fontSize: 16),)),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal.withOpacity(0.7) : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal.withOpacity(0.7) : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal.withOpacity(0.7) : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withOpacity(0),
                border: Border.all(color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal, width: 2.0),      
              ),
              child: RaisedButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: Colors.transparent,
                child: Text('VER MÁS INFORMACIÓN', style: TextStyle(color: Colors.white, fontSize: 16),),
                onPressed: () {

                }
              ),
            )
          ]
        ),
      )
    );
  }
}