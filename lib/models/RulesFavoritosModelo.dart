import 'dart:convert';


RulesFavoritosModelo RulesFavoritosModeloJson(String str)=> RulesFavoritosModelo.fromJson(json.decode(str));

String RulesFavoritosModeloToJson(RulesFavoritosModelo data) => json.encode(data.toJson());

class RulesFavoritosModelo{
  String usuario;

  RulesFavoritosModelo({this.usuario});

  factory RulesFavoritosModelo.fromJson(Map<String,dynamic> json){
   return RulesFavoritosModelo(

    usuario: json["usuario"],

  );

  }

  Map<String,dynamic> toJson()=>{
    "usuario": usuario,

  };


}
