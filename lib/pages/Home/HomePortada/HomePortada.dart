import 'package:flutter/material.dart';

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
                'Mikel', 
                style: TextStyle(
                  fontFamily: 'BluuNext', fontSize: 70, color: Colors.white
                ),
              )
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Gryffindor/LogoGry.png'),                   
                )
              ),
            ),
            Container(
              child: Text(
                'Eres un', 
                style: TextStyle(
                  fontFamily: 'BluuNext', fontSize: 30, color: Colors.white
                ),
              )
            ),
            SizedBox(height: 10),
            Container(
              child: Text(
                'GRYFFINDOR', 
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
      )
    );
  }
}