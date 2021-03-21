import 'dart:convert';

UsuarioModelo UsuarioModeloJson(String str)=> UsuarioModelo.fromJson(json.decode(str));

String UsuarioModeloToJson(UsuarioModelo data) => json.encode(data.toJson());

//modelo de usuario
class UsuarioModelo{
  String id;
  String usuario;
    String password;
    String email;

  UsuarioModelo({this.id,this.usuario,this.password,this.email});

  factory UsuarioModelo.fromJson(Map<String,dynamic> json) => UsuarioModelo(
    id: json["id"],
    usuario: json["usuario"],
    password: json["password"],
    email: json["email"],
  );

  Map<String,dynamic> toJson()=>{
    "id": id,
    "usuario": usuario,
    "password": password,
    "email": email,
  };

  String get idUsuario => id;

  String get usuarioUsuario => usuario;

  String get contrasena => password;

  String get emailUsuario => email;

}