import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hogwarts_rules/pages/Home/HomeInfo/Libros/InfoLibros.dart';
import 'package:hogwarts_rules/widgets/custom_alert_dialog.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;


class HomeLibros extends StatelessWidget {
  const HomeLibros
({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget> [
        CarouselSlider(
          options: CarouselOptions(
            height: 210.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.33,
          ),      
          items: [
            for(var i=1; i<8; i++)        
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('images/Libros/${i}.jpg'),
                      fit: BoxFit.cover,
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
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [                         
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/Libros/${i}.jpg'),
                                  fit: BoxFit.cover
                                ),
                              ),
                              width: 304,
                              height: 488,
                            ),
                            SizedBox(height: 20,),
                            Container(
                              decoration: BoxDecoration(
                                color: globals.grySecundario.withOpacity(0.7),
                                border: Border.all(color: globals.grySecundario, width: 2.0),      
                              ),
                              child: RaisedButton(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                color: Colors.transparent,
                                child: Text('VER MÁS INFORMACIÓN', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => InfoLibros(i),
                                  ));
                                }
                              ),
                            ),                          
                          ], 
                        ),
                      );
                    }
                  );
                },
              ),
          ],
        ),
      ],
    );
  }
}