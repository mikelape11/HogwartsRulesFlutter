import 'package:flutter/material.dart';
import 'package:hogwarts_rules/pages/Home/HomeInfo/Libros/HomeLibros.dart';
import 'package:hogwarts_rules/pages/Home/HomeInfo/Peliculas/HomePeliculas.dart';


class HomeInfo extends StatelessWidget {
  const HomeInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.3,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              child: Text(
                'Peliculas / Libros', 
                style: TextStyle(
                  fontFamily: 'BluuNext', fontSize: 45, color: Colors.white
                ),
              )
            ),
            SizedBox(height: 30,),
            HomePeliculas(),
            SizedBox(height: 30,),
            HomeLibros(),
          ]
        ),  
      ),
    );
  }
}