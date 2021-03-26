import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hogwarts_rules/models/UsuarioModelo.dart';

class LoginAPI extends StatefulWidget {
  const LoginAPI({Key key}) : super(key: key);

  @override
  _LoginAPIState createState() => _LoginAPIState();
}

    Future<List<UsuarioModelo>> getUsuarios() async {    
      var data = await http.get('http://10.0.2.2:8080/todos');
      var jsonData = json.decode(data.body);
      
      List<UsuarioModelo> usuario = []; 
      for (var e in jsonData) {
        UsuarioModelo usuarios = new UsuarioModelo();
        usuarios.usuario = e["usuario"];
        usuarios.password = e["password"];
        usuario.add(usuarios);
      }
      return usuario;
    }


class _LoginAPIState extends State<LoginAPI> {

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}