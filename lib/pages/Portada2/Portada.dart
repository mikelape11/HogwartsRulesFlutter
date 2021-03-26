import 'package:flutter/material.dart';
import 'package:hogwarts_rules/pages/Portada2/Login.dart';
import 'package:hogwarts_rules/pages/Portada2/RegistroOption.dart';
import 'package:hogwarts_rules/pages/Portada2/loginOption.dart';
import 'package:hogwarts_rules/pages/Portada2/Registro.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
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
                height: login ? MediaQuery.of(context).size.height * 0.6 : MediaQuery.of(context).size.height * 0.4,
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
                height: login ? MediaQuery.of(context).size.height * 0.4 : MediaQuery.of(context).size.height * 0.6,
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
    paint.color = Color(globals.color1);
    paint.style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.5, outterCurve ? size.height + 110 : size.height - 110, size.width, size.height);
    path.lineTo(size.width, 0);

    path.close();

    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}