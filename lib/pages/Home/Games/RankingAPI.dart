import 'package:flutter/material.dart';
import 'package:hogwarts_rules/models/RankingModelo.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';

class RankingAPI extends StatefulWidget {
  RankingAPI({Key key}) : super(key: key);

  @override
  _RankingAPIState createState() => _RankingAPIState();
}

  Future<RankingModelo> registrarRanking(String usuario, String casaHogwarts, int puntos, String avatar) async{
      var Url = "http://10.0.2.2:8080/nuevoRanking";
      var response = await http.post(Url,headers:<String , String>{"Content-Type": "application/json"},
      body:jsonEncode(<String , dynamic>{
        "usuario" : usuario,
        "casaHogwarts" : casaHogwarts,
        "puntos": puntos,
        "avatar": avatar
      }));
    }


    Future<List<RankingModelo>> getRankingPorCasa(String casaHogwarts) async {    
      var data = await http.get('http://10.0.2.2:8080//getOrdenado/$casaHogwarts');
      var jsonData = json.decode(data.body);
      
      List<RankingModelo> rankings = []; 
      for (var e in jsonData) {
        RankingModelo ranking = new RankingModelo();
        ranking.id = e["_id"];
        ranking.usuario = e["usuario"];
        ranking.avatar = e["avatar"];
        ranking.puntos = e["puntos"];
        ranking.casaHogwarts = e["casaHogwarts"];
        rankings.add(ranking);
      }
      return rankings;
    }


class _RankingAPIState extends State<RankingAPI> {
  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}