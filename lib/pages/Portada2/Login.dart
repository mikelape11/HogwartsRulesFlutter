import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text(
            "Welcome to",
            style: TextStyle(
              fontSize: 16,
              color: Color(globals.color2),
              height: 2,
            )
          ),
          Text(
            "HOGWARTS RULES",
            style: TextStyle(
              fontSize: 36,
              color: Color(globals.color2),
              height: 1,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            )
          ),
          Text(
            "Inicia Sesión para continuar",
            style: TextStyle(
              fontSize: 16,
              color: Color(globals.color2),
              height: 1,
            )
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: "Usuario",
              hintStyle: TextStyle(
                fontSize: 16,
                color: Color(globals.color3),
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 0, style: BorderStyle.none),
              ),
              filled: true,
              fillColor: Color(globals.color4),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            )
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold),
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(
                fontSize: 16,
                color: Color(globals.color3),
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 0, style: BorderStyle.none),
              ),
              filled: true,
              fillColor: Color(globals.color4),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            )
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Color(globals.color2),
              borderRadius: BorderRadius.all(
                Radius.circular(25)
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(globals.color2).withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0,3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(globals.color1),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "HAS OLVIDADO LA CONTRASEÑA?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(globals.color2),
              height: 1,
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              // color: Colors.black87,
              image: DecorationImage(
                image:  AssetImage('images/LOGOS/Logo2.png'),
                fit: BoxFit.cover, 
              )
            ),
          )
        ]
      ),
    );
  }
}