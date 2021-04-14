import 'dart:convert';


imagenRespuestasModelo imagenRespuestasModeloJson(String str)=> imagenRespuestasModelo.fromJson(json.decode(str));

String imagenRespuestasModeloToJson(imagenRespuestasModelo data) => json.encode(data.toJson());

//modelo de preguntasRespuestas
class imagenRespuestasModelo{
  String name;
  String thumbUrl;

  imagenRespuestasModelo({this.name,this.thumbUrl});

  factory imagenRespuestasModelo.fromJson(Map<String,dynamic> json){
   return imagenRespuestasModelo(

    name: json["name"],
    thumbUrl: json["thumbUrl"],

  );

  }

  Map<String,dynamic> toJson()=>{
    "name": name,
    "thumbUrl": thumbUrl,

  };


}
