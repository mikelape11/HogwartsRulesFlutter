import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Home/Informacion/TestPatronus/TestPatronus.dart';
import 'package:hogwarts_rules/pages/Home/Informacion/TestVarita/TestVarita.dart';

class HomeSeleccion extends StatelessWidget {
  const HomeSeleccion({Key key}) : super(key: key);

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
                'Varita / Patronus', 
                style: TextStyle(
                  fontFamily: 'BluuNext', fontSize: 45, color: Colors.white
                ),
              )
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    color: Colors.white.withOpacity(0.05),
                    height: 300,
                    width: MediaQuery.of(context).size.width/2.2,
                    child: Center(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/Gryffindor/LogoGry.png'),                   
                          )
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TestVarita(),
                    ));
                  },
                ),
                SizedBox(width: 6),
                GestureDetector(
                  child: Container(
                    color: Colors.white.withOpacity(0.05),
                    height: 300,
                    width: MediaQuery.of(context).size.width/2.2,
                    child: Center(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/Gryffindor/LogoGry.png'),                   
                          )
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TestPatronus(),
                    ));
                  },
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              color: Colors.white.withOpacity(0.05),
              height: 150,
              width: MediaQuery.of(context).size.width/1.08,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text('¡Haz estos breves test para ver cual es tu varita y tu patronus!', style: TextStyle(color: Colors.white, fontFamily: 'BluuNext', fontSize: 20), textAlign: TextAlign.center,)),
              ),
            )
          ]
        ),
      )
    );
  }
}