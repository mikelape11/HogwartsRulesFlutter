import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;

class Rules extends StatelessWidget {
  const Rules({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(     
      height: MediaQuery.of(context).size.height/1.22,
      child: ListView(
        children: [
          for(var i=0; i<5; i++)
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario , width: 1.0)),      
              color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withRed(80),
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [     
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            //image: AssetImage('${widget.snapshot.data[i].avatar}'),
                            image: AssetImage("images/LOGOS/LogoPeque.png"),
                            fit: BoxFit.fitHeight,  
                          ),
                        ),
                        height: 70,
                        width: MediaQuery.of(context).size.width/4,
                      ),                   
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text('Mikel', style: TextStyle(color: globals.casaHogwarts == "Gryffindor"
                          ? globals.grySecundario
                          : globals.casaHogwarts == "Slytherin"
                              ? globals.slySecundario
                              : globals.casaHogwarts == "Ravenclaw"
                                  ? globals.ravSecundario
                                  : globals.casaHogwarts == "Hufflepuff"
                                      ? globals.hufSecundario
                                      : globals.grySecundario,  fontWeight: FontWeight.bold, fontSize: 17), textAlign: TextAlign.start,),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 280,
                        child: Text(
                          'Lorem ipsum dolor sit amet consectetur adipiscing elit varius odio suspendisse aliquet himenaeos, massa rutrum tempus platea parturient consequat quam porta hac curabitur. Lobortis praesent tincidunt elementum venenatis laoreet turpis cras sociis dictumst',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ), 
                      SizedBox(height: 20,),            
                      Container(
                        width: MediaQuery.of(context).size.width/1.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Icon(Icons.mode_comment_outlined , color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20,),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    child: Text('1', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontSize: 15, fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Icon(Icons.loop, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20,),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    child: Text('1', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontSize: 15, fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: Icon(Icons.favorite_outline, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20,),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    child: Text('1', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontSize: 15, fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),                    
          )            
        ],          
      ),          
    );
  }
}