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
      body: SingleChildScrollView(
        child: Container(
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
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height/1.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:  AssetImage('images/LOGOS/Logo3.png'),
                      //fit: BoxFit.cover, 
                    )
                  ),
                ),
              ),
              Row(
                children: [                 
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/carta.png'),
                        //fit: BoxFit.cover, 
                      )
                    ),   
                  ),                                                 
                  SizedBox(width: MediaQuery.of(context).size.width/2.1),        
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:  AssetImage('images/hat.png'),
                        //fit: BoxFit.cover, 
                      )
                    ),  
                  ), 
                ],
              ),                     
            ],
          ),
        ),
      )
    );
  }
}