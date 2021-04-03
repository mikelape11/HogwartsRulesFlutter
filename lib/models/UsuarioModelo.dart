import 'dart:convert';

UsuarioModelo UsuarioModeloJson(String str)=> UsuarioModelo.fromJson(json.decode(str));

String UsuarioModeloToJson(UsuarioModelo data) => json.encode(data.toJson());

//modelo de usuario
class UsuarioModelo{
  String id;
  String usuario;
  String password;
  String email;
  String casaHogwarts;
  String avatar;
  int rol;


  UsuarioModelo({this.id,this.usuario,this.password,this.email,this.casaHogwarts,this.avatar,this.rol});

  factory UsuarioModelo.fromJson(Map<String,dynamic> json) => UsuarioModelo(
    id: json["_id"],
    usuario: json["usuario"],
    password: json["password"],
    email: json["email"],
    casaHogwarts: json["casaHogwarts"],
    avatar: json["avatar"],
    rol: json["rol"]
  );

  Map<String,dynamic> toJson()=>{
    "_id": id,
    "usuario": usuario,
    "password": password,
    "email": email,
    "casaHogwarts": casaHogwarts,
    "avatar": avatar,
    "rol": rol,
  };

  String get idUsuario => id;

  String get usuarioUsuario => usuario;

  String get contrasena => password;

  String get emailUsuario => email;

  String get casaHogwartsUsuario => casaHogwarts;

  String get avatarUsuario => avatar;

  int get rolUsuario => rol;

}