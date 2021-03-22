import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hogwarts_rules/widgets/custom_alert_dialog.dart';

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
          height: 210.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.33,
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
                        content: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/Libros/${i}.jpg'),
                              fit: BoxFit.cover
                            ),
                          ),
                          width: 304,
                          height: 488,
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
