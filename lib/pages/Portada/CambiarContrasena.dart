import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;

import 'LoginAPI.dart';
import 'Portada.dart';


class CambiarContrasena extends StatefulWidget {
  const CambiarContrasena({Key key}) : super(key: key);

  @override
  _CambiarContrasenaState createState() => _CambiarContrasenaState();
}

class _CambiarContrasenaState extends State<CambiarContrasena> {

  String _usuario;
  String _password;
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  List<GlobalKey<FormState>> _formKeysList= [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  bool _passwordVisible = false;
  bool _comprobar = false;

  //validaciones de usuario
  String validarUsuario(String value) {
    if (value.isEmpty) {
      return "Rellena el campo";
    } else if (value.length < 5) {
      return "Tiene que tener como minimo 5 caracteres";
    } else if (value.length > 10) {
      return "Tiene que tener como maximo 10 caracteres";
    } else if(value == _usuario){
      return "El usuario no existe";
    } else 
      return null;
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(globals.color1),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(globals.color1), Color(globals.color2)]
          )
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/1.6,
                    child: Text("¿Has olvidado la contraseña?", style: TextStyle(color: Color(globals.color2), fontSize: 30, fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    child: Icon(Icons.lock, color: Color(globals.color2), size: 80,),                  
                  ),
                ],           
              ),
              SizedBox(height: 20,),
              Visibility(
                visible: !_comprobar,
                child: Container(
                  child: Form(
                    autovalidate: true,
                    key: _formKeysList[0],
                    child: TextFormField(
                      controller: firstController,
                      validator: validarUsuario,
                      onSaved: (String value){
                        _usuario = value;
                      },
                      style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: "Usuario o Email",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color(globals.color3),
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(width: 0, style: BorderStyle.none),
                        ),
                        filled: true,
                        fillColor: Color(globals.color4),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      )
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: _comprobar,
                child: Container(
                  child: Form(
                    autovalidate: true,
                    key: _formKeysList[1],
                    child: TextFormField(
                      obscureText: !_passwordVisible,
                      controller: secondController,
                      validator: (String value){
                        if (value.isEmpty) {
                            return "Rellena el campo";
                          } else if (value.length < 8) {
                            return "Tiene que tener como minimo 8 caracteres";
                          } else if (value.length > 12) {
                            return "Tiene que tener como maximo 12 caracteres";
                          } else if(value == _password){
                            return "La contraseña no es correcta";
                          } else 
                            return null;
                      },
                      onSaved: (String value){
                        _password = value;
                      },
                      style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color(globals.color3),
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(width: 0, style: BorderStyle.none),
                        ),
                        filled: true,
                        fillColor: Color(globals.color4),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                            size: 25.0,
                            color: Color(globals.color2),
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      )
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 40,
                decoration: BoxDecoration(
                  color: Color(globals.color1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(globals.color2).withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0,2),
                    ),
                  ],
                ),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(globals.color1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(globals.color1).withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: Offset(0,3),
                      ),
                    ],
                  ), //BOTON LOGIN
                  child: FutureBuilder(
                    future: getUsuarios(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25)),
                        color: Color(globals.color2),
                        child: Text(
                          _comprobar == false ? "COMPROBAR USUARIO" : "CAMBIAR CONTRASEÑA",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(globals.color1),
                          ),
                        ),
                        onPressed: () async{
                          if(_comprobar == true)                         
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Portada(),
                            ));                             
                          setState(() {
                            _comprobar = true;
                          });
                        },
                      );
                    }
                  )
                ),
              ),                              
            ],
          ),
        ),
      ),
    );
  }
}
