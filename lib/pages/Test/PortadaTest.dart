import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_rules/pages/Test/Test.dart';

class PortadaTest extends StatefulWidget {
  const PortadaTest({Key key}) : super(key: key);

  @override
  _PortadaTestState createState() => _PortadaTestState();
}

class _PortadaTestState extends State<PortadaTest> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 12), () => Navigator.push(
      context, MaterialPageRoute(builder: (context) => Test())
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          image: DecorationImage(
            image:  AssetImage('images/fondoNegro.png'),
            fit: BoxFit.fitWidth,  
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            child: SizedBox(
              width: 250.0,
              child: FadeAnimatedTextKit(
                duration: Duration(milliseconds: 2500),
                //speed: Duration(milliseconds: 80),
                onTap: () {
                    print("Tap Event");
                  },
                text: [
                  "Bienvenido Mikel,",
                  "Antes de nada deberás de realizar un breve test",
                  "Para que podamos saber a que casa perteneces",
                  "¡Mucha suerte!",
                ],
                textStyle: TextStyle(
                    fontSize: 30.0,
                    fontFamily: "BluuNext",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ),
      ),
    );
  }
}