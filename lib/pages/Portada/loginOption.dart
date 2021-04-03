import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;

class LoginOption extends StatelessWidget {
  const LoginOption({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
         SizedBox(
          height: 16,
        ),
        Text(
          "Ya tienes una cuenta?",
          style: TextStyle(
            fontSize: 16, 
            color: Color(globals.color2)
          ),
        ),
        SizedBox(
          height: 16,
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
      ],
    );
  }
}