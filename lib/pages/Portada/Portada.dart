import 'package:flutter/material.dart';

class Portada extends StatefulWidget {
  Portada({Key key}) : super(key: key);

  @override
  _PortadaState createState() => _PortadaState();
}

class _PortadaState extends State<Portada> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // color: Colors.black87,
          image: DecorationImage(
            image:  AssetImage('images/fondo_02.jpg'),
            fit: BoxFit.cover, 
          )
        ),
        width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:  AssetImage('images/LOGOS/Logo3.png'),
                  //fit: BoxFit.cover, 
                )
              ),
            ),
            Row(
              children: [
                SizedBox(height: 400),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.yellow[900], size: 40,),
                    // onPressed: ,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(),
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward, color: Colors.blue[900], size: 40,),
                    // onPressed: ,
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}