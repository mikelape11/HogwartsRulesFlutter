import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;

class Games extends StatelessWidget {
  const Games({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.25,
      child: ListView(
        children: [
          SizedBox(height: 10,),
          for(var i=0; i<4; i++)
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
                  ],
                ),                    
              ),
            ),
          ),      
          SizedBox(height: 25,),  
        ],          
      ),          
    );
  }
}