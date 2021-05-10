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

    Future<List<RankingModelo>> getRankingPorCasa(String casaHogwarts) async {    
      var data = await http.get(globals.ip+'//getOrdenado/$casaHogwarts');
      var jsonData = json.decode(data.body);
      
      List<RankingModelo> rankings = []; 
      for (var e in jsonData) {
        RankingModelo ranking = new RankingModelo();
        ranking.id = e["_id"];
        ranking.usuario = e["usuario"];
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