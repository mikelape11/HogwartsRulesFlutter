import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hogwarts_rules/models/EleccionCasaModelo.dart';
import 'package:hogwarts_rules/models/OpinionModelo.dart';
import 'package:hogwarts_rules/models/UsuarioModelo.dart';
import 'package:http/http.dart' as http;
import 'package:hogwarts_rules/models/PreguntasRespuestasModelo.dart';

import '../../models/TestModelo.dart';

class OpinionAPI extends StatefulWidget {
  const OpinionAPI({Key key}) : super(key: key);

  @override
  _OpinionAPIState createState() => _OpinionAPIState();
}

  Future<OpinionModelo> registrarOpinion(String usuario, String valoracion, double puntuacion, String avatar) async{
    var Url = "http://10.0.2.2:8080/guardarOpinion";
    var response = await http.post(Url,headers:<String , String>{"Content-Type": "application/json"},
    body:jsonEncode(<String , String>{
      "usuario" : usuario,
      "valoracion": valoracion,
      "puntuacion": puntuacion.toString(),
      "avatar": avatar
    }));
  }

  Future<List<OpinionModelo>> getOpiniones() async {    
      var data = await http.get('http://10.0.2.2:8080/getOpinionesOrdenadas');
      var jsonData = json.decode(data.body);

      
      List<OpinionModelo> opinion = []; 
      for (var e in jsonData) {
        OpinionModelo opiniones = new OpinionModelo();
        opiniones.usuario = e["usuario"];
        opiniones.valoracion = e["valoracion"];
        opiniones.puntuacion = e["puntuacion"];
        opiniones.avatar = e["avatar"];
        opinion.add(opiniones);
      }
      return opinion;
    }

class _OpinionAPIState extends State<OpinionAPI> {

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}