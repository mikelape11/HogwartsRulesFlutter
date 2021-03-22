import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;

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
            SizedBox(height: 35,),
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
                          image:  AssetImage('${globals.fondoPersonajeGry}'),
                          fit: BoxFit.fill,  
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.06),
                      width: MediaQuery.of(context).size.width/3.2,
                      child: Center(
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('${globals.personajeGry3}'),                   
                            )
                          ),
                        ),
                      ),
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
                          image:  AssetImage('${globals.fondoPersonajeGry}'),
                          fit: BoxFit.fill,  
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.06),
                      width: MediaQuery.of(context).size.width/3.2,
                      child: Center(
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('${globals.personajeGry1}'),                   
                            )
                          ),
                        ),
                      ),
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
                          image:  AssetImage('${globals.fondoPersonajeGry}'),
                          fit: BoxFit.fill,  
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.06),
                      width: MediaQuery.of(context).size.width/3.2,
                      child: Center(
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('${globals.personajeGry2}'),                   
                            )
                          ),
                        ),
                      ),
                    ),
                  ],                 
                ),
              ],
            ),
            SizedBox(height: 35,),
            Container(
              color: Colors.white.withOpacity(0.05),
              height: 150,
              width: MediaQuery.of(context).size.width/1.08,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Muy buenas kaka ez asd fasdf a asdfa asdflasjf a a fs', style: TextStyle(color: Colors.white, fontFamily: 'BluuNext', fontSize: 20),)),
              ),
            )
          ]
        ),
      )
    );
  }
}