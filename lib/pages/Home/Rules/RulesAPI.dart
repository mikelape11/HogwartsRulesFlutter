import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hogwarts_rules/models/ComentariosModelo.dart';
import 'package:hogwarts_rules/models/RulesFavoritosModelo.dart';
import 'package:hogwarts_rules/models/RulesModelo.dart';
import 'package:http/http.dart' as http;
import 'package:hogwarts_rules/globals/globals.dart' as globals;

class RulesAPI extends StatefulWidget {
  const RulesAPI({Key key}) : super(key: key);

  @override
  _RulesAPIState createState() => _RulesAPIState();
}

     Future<List<RulesModelo>> getRules() async {    
      var data = await http.get('http://10.0.2.2:8080/todosRules');
      var jsonData = json.decode(utf8.decode(data.bodyBytes));
      
      List<RulesModelo> rules = []; 
      for (var e in jsonData) {
        RulesModelo rule = new RulesModelo();
        rule.id = e["_id"];
        rule.usuario = e["usuario"];
        rule.avatar = e["avatar"];
        rule.rol = e["rol"];
        rule.rule = e["rule"];
        rule.foto = e["foto"];
        var list = e['comentarios'] as List;
        rule.comentarios =  list.map((i) => ComentariosModelo.fromJson(i)).toList();
        var list2= e['favoritos'] as List;
        rule.favoritos =  list2.map((i) => RulesFavoritosModelo.fromJson(i)).toList();
        rules.add(rule);
      }
      return rules;
    }

  Future<RulesModelo> registrarRule(String usuario, String avatar, int rol, String rule, String foto, List<ComentariosModelo> comentarios, List<RulesFavoritosModelo> favoritos) async{
    var Url = 'http://10.0.2.2:8080/registrarRules';
    var response = await http.post(Url,headers:<String , String>{"Content-Type": "application/json"},
    body:jsonEncode(<String , dynamic>{
      "usuario" : usuario,
      "avatar": avatar,
      "rol" : rol.toString(),
      "rule": rule,
      "foto": foto,
      "comentarios": comentarios,
      "favoritos": favoritos,
    }));
  }

  Future<RulesModelo> actualizarRule(RulesModelo rule) async{
    var Url = 'http://10.0.2.2:8080/actualizarRule';
    var response = await http.put(Url,headers:<String , String>{"Content-Type": "application/json"},
    body: jsonEncode(rule));
  }



  Future<RulesModelo> deleteLikeFavoritos(String id, List<RulesFavoritosModelo> favUsuario) async{
   var Url =     Uri.parse('http://10.0.2.2:8080/eliminarFavorito');
     var response = await http.put(Url,headers:<String , String>{"Content-Type": "application/json"},
    body:jsonEncode(<String , dynamic>{
      "_id" : id,
      "favoritos" : favUsuario,
    }));
    
  }


class _RulesAPIState extends State<RulesAPI> {

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}