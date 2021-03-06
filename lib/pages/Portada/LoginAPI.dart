import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hogwarts_rules/models/UsuarioModelo.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
class LoginAPI extends StatefulWidget {
  const LoginAPI({Key key}) : super(key: key);

  @override
  _LoginAPIState createState() => _LoginAPIState();
}

    Future<List<UsuarioModelo>> getUsuarios() async {    
      var data = await http.get('http://10.0.2.2:8080/todos');
      var jsonData = json.decode(utf8.decode(data.bodyBytes));
      
      List<UsuarioModelo> usuario = []; 
      for (var e in jsonData) {
        UsuarioModelo usuarios = new UsuarioModelo();
        usuarios.id = e["_id"];
        usuarios.usuario = e["usuario"];
        usuarios.password = e["password"];
        usuarios.email = e["email"];
        usuarios.casaHogwarts = e["casaHogwarts"];
        usuarios.varita = e["varita"];
        usuarios.patronus = e["patronus"];
        usuarios.avatar = e["avatar"];
        usuarios.rol = e["rol"];
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