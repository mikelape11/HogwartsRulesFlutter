import 'package:flutter/material.dart';
import 'package:hogwarts_rules/models/UsuarioModelo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
class CuentaAPI extends StatefulWidget {
  CuentaAPI({Key key}) : super(key: key);

  @override
  _CuentaAPIState createState() => _CuentaAPIState();
}

Future<UsuarioModelo> actualizarUsuario(UsuarioModelo usuario) async{
    var Url = globals.ip+'/actualizarUsuario';
    var response = await http.put(Url,headers:<String , String>{"Content-Type": "application/json"},
    body: jsonEncode(usuario));
  }

Future<http.Response> deleteCuenta(String usuario) async {
    final http.Response response = await http.delete(
      globals.ip+'/eliminarPorNombre/${usuario}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }

class _CuentaAPIState extends State<CuentaAPI> {
  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}