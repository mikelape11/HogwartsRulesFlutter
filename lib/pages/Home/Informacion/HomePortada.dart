import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;

class HomePortada extends StatelessWidget {
  const HomePortada({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.12,
      child: Center(
        child: Column(
            children: [
              SizedBox(height: 80),
              Container(
                child: Text(
                  '${globals.usuario}', 
                  style: TextStyle(
                    fontFamily: 'BluuNext', fontSize: 70, color: Colors.white
                  ),
                )
              ),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.logoGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.logoSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.logoRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.logoHuf}') : AssetImage(globals.casaHogwarts),                
                  )
                ),
              ),
              Container(
                child: Text(
                  'Eres un/a', 
                  style: TextStyle(
                    fontFamily: 'BluuNext', fontSize: 30, color: Colors.white
                  ),
                )
              ),
              SizedBox(height: 10),
              Container(
                child: Text(
                  globals.casaHogwarts == "Gryffindor" ? "GRYFFINDOR" : globals.casaHogwarts == "Slytherin" ? "SLYTHERIN" : globals.casaHogwarts == "Ravenclaw" ? "RAVENCLAW" : globals.casaHogwarts == "Hufflepuff" ? "HUFFLEPUFF" :  "", 
                  style: TextStyle(
                    fontFamily: 'BluuNext', fontSize: 30, color: Colors.white
                  ),
                )
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/arrowdown.png'),                   
                  )
                ),
              ),
            ]
          ),       
        ),
    );
  }
}