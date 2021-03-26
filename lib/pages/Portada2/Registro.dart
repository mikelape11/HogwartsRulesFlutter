import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;

class Registro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Registrate con",
          style: TextStyle(
            fontSize: 16,
            color: Color(globals.color1),
            height: 2,
          ),
        ),
        Text(
          "HOGWARTS RULES",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(globals.color1),
            height: 1,
            letterSpacing: 2,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Usuario",
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color(globals.color4),
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
            ),
            filled: true,
            fillColor: Colors.yellow[700].withOpacity(0.5),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          )
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color(globals.color4),
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
            ),
            filled: true,
            fillColor: Colors.yellow[700].withOpacity(0.5),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          )
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Color(globals.color1),
            borderRadius: BorderRadius.all(
              Radius.circular(25)
            ),
            boxShadow: [
              BoxShadow(
                color: Color(globals.color1).withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0,3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              "REGISTRO",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(globals.color2),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "O registrate con",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(globals.color1),
            height: 1,
          )
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Entypo.facebook_with_circle,
              size: 32,
              color: Color(globals.color1),
            ),
            SizedBox(
              width: 16,
            ),
            Icon(
              Entypo.twitter_with_circle,
              size: 32,
              color: Color(globals.color1),
            ),
            SizedBox(
              width: 16,
            ),
            Icon(
              Entypo.google__with_circle,
              size: 32,
              color: Color(globals.color1),
            ),
          ],
        ),
      ],
    );
  }
}