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
                          image:  AssetImage('${globals.fondoPersonajeGry}'),
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
                                image: AssetImage('${globals.personajeGry3}'),                   
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
                                          image:  AssetImage('${globals.fondoPersonajeGry}'),
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
                                          image: AssetImage('${globals.personajeGry3}'),
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
                                      image:  AssetImage('${globals.fondoPersonajeGry}'),
                                      fit: BoxFit.fill,  
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      "Lorem ipsum dolor sit amet consectetur, adipiscing elit potenti facilisi dignissim lectus, netus nec suspendisse quam. Mauris pretium fringilla hendrerit lacinia ornare velit lectus aliquet varius venenatis, ante aliquam placerat parturient elementum fermentum vestibulum tincidunt penatibus, at vulputate augue nibh sagittis nullam ut inceptos conubia. Enim class himenaeos magna vehicula senectus condimentum gravida habitasse, odio pellentesque dui tincidunt blandit primis ornare, natoque facilisis rhoncus elementum fermentum velit diam.",
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
                          image:  AssetImage('${globals.fondoPersonajeGry}'),
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
                                image: AssetImage('${globals.personajeGry1}'),                   
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
                                          image:  AssetImage('${globals.fondoPersonajeGry}'),
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
                                          image: AssetImage('${globals.personajeGry1}'),
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
                                      image:  AssetImage('${globals.fondoPersonajeGry}'),
                                      fit: BoxFit.fill,  
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      "Lorem ipsum dolor sit amet consectetur, adipiscing elit potenti facilisi dignissim lectus, netus nec suspendisse quam. Mauris pretium fringilla hendrerit lacinia ornare velit lectus aliquet varius venenatis, ante aliquam placerat parturient elementum fermentum vestibulum tincidunt penatibus, at vulputate augue nibh sagittis nullam ut inceptos conubia. Enim class himenaeos magna vehicula senectus condimentum gravida habitasse, odio pellentesque dui tincidunt blandit primis ornare, natoque facilisis rhoncus elementum fermentum velit diam.",
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
                          image:  AssetImage('${globals.fondoPersonajeGry}'),
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
                                image: AssetImage('${globals.personajeGry2}'),                   
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
                                          image:  AssetImage('${globals.fondoPersonajeGry}'),
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
                                          image: AssetImage('${globals.personajeGry2}'),
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
                                      image:  AssetImage('${globals.fondoPersonajeGry}'),
                                      fit: BoxFit.fill,  
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      "Lorem ipsum dolor sit amet consectetur, adipiscing elit potenti facilisi dignissim lectus, netus nec suspendisse quam. Mauris pretium fringilla hendrerit lacinia ornare velit lectus aliquet varius venenatis, ante aliquam placerat parturient elementum fermentum vestibulum tincidunt penatibus, at vulputate augue nibh sagittis nullam ut inceptos conubia. Enim class himenaeos magna vehicula senectus condimentum gravida habitasse, odio pellentesque dui tincidunt blandit primis ornare, natoque facilisis rhoncus elementum fermentum velit diam.",
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
              color: Colors.white.withOpacity(0.05),
              height: 150,
              width: MediaQuery.of(context).size.width/1.08,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Muy buenas kaka ez asd fasdf a asdfa asdflasjf a a fs', style: TextStyle(color: Colors.white, fontFamily: 'BluuNext', fontSize: 20),)),
              ),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: globals.slyPrincipal.withOpacity(0.7),
                    border: Border.all(color: globals.slyPrincipal, width: 2.0),      
                  ),
                  child: RaisedButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: Colors.transparent,
                    child: Text('Slytherin', style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      
                    }
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: globals.ravPrincipal.withOpacity(0.7),
                    border: Border.all(color: globals.ravPrincipal, width: 2.0),      
                  ),
                  child: RaisedButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: Colors.transparent,
                    child: Text('Ravenclaw', style: TextStyle(color: Colors.white),),
                    onPressed: () {

                    }
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: globals.hufPrincipal.withOpacity(0.7),
                    border: Border.all(color: globals.hufPrincipal, width: 2.0),      
                  ),
                  child: RaisedButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: Colors.transparent,
                    child: Text('Hufflepuff', style: TextStyle(color: Colors.white),),
                    onPressed: () {

                    }
                  ),
                ),
              ],
            )
          ]
        ),
      )
    );
  }
}