import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hogwarts_rules/models/UsuarioModelo.dart';

class RegistroAPI extends StatefulWidget {
  const RegistroAPI({Key key}) : super(key: key);

  @override
  _RegistroAPIState createState() => _RegistroAPIState();
}

//funcion que registra un usuario en la base de datos
  Future<UsuarioModelo> registrarUsuario(String usuario, String password, String email) async{
    var Url = "http://10.0.2.2:8080/register";
    var response = await http.post(Url,headers:<String , String>{"Content-Type": "application/json"},
    body:jsonEncode(<String , String>{
      "usuario" : usuario,
      "password" : password,
      "email": email
    }));
  }

//funcion que devuelve los usuarios de la api
    Future<List<UsuarioModelo>> getUsuarios() async {    
      var data = await http.get('http://10.0.2.2:8080/todos');
      var jsonData = json.decode(data.body);

      List<UsuarioModelo> usuario = []; 
      for (var e in jsonData) {
        UsuarioModelo usuarios = new UsuarioModelo();
        usuarios.usuario = e["usuario"];
        usuarios.email = e["email"];
        usuarios.password = e["password"];
        usuario.add(usuarios);
      }
      return usuario;
    }

class _RegistroAPIState extends State<RegistroAPI> {
  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}