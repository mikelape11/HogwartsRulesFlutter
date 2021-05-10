import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:hogwarts_rules/pages/Portada/Login.dart';
import 'package:hogwarts_rules/pages/Portada/RegistroOption.dart';
import 'package:hogwarts_rules/pages/Portada/LoginOption.dart';
import 'package:hogwarts_rules/pages/Portada/Registro.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;

import 'Login.dart';
import 'LoginOption.dart';
class Portada extends StatefulWidget {
  Portada({Key key}) : super(key: key);

  @override
  _PortadaState createState() => _PortadaState();
}

class _PortadaState extends State<Portada> {

  bool login = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(globals.color2),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                setState(() {
                  login = true;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                height: login ? MediaQuery.of(context).size.height * 0.65 : MediaQuery.of(context).size.height * 0.35,
                child: CustomPaint(
                  painter: CurvePainter(login),
                  child: Container(
                    padding: EdgeInsets.only(bottom: login ? 0 : 55),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          child: login 
                            ? Login()
                            : LoginOption(),
                        ),
                      ),
                    ),
                  )
                )
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  login = false;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                height: login ? MediaQuery.of(context).size.height * 0.35 : MediaQuery.of(context).size.height * 0.65,
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16), 
                        child: !login
                          ? Registro()
                          : RegistroOption(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]
        )
      ),
    );
  }
}

class CurvePainter extends CustomPainter{
  bool outterCurve;
  CurvePainter(this.outterCurve);

  @override
  void paint(Canvas canvas, Size size){
    var paint = Paint();
    paint.color = Color(globals.color2);
    paint.style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.5, outterCurve ? size.height + 110 : size.height - 110, size.width, size.height);
    path.lineTo(size.width, 0);

    path.close();
 
    var paint2 = Paint();
    // paint2.color = globals.grySecundario;
    paint2.style = PaintingStyle.fill;
    
    paint2.shader = ui.Gradient.linear(
      Offset(200, 0),
      Offset(200, 0),
      <Color>[
        Colors.green.withOpacity(0.3),
        Colors.green.withOpacity(1.0),
      ],  
    );

    Path path2 = Path();
    path2.moveTo(0, 0);
    path2.lineTo(0, size.height+10);
    path2.quadraticBezierTo(size.width * 0.5, outterCurve ? size.height + 130 : size.height - 90, size.width, size.height+10);
    path2.lineTo(size.width, 0);

    path2.close();

    canvas.drawPath(path2, paint2);
    canvas.drawPath(path, paint);

    //change the alpha color of your grey color like this 
    //canvas.drawShadow(path, Colors.grey.withAlpha(50), 4.0, false);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}