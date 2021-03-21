import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_rules/models/UsuarioModelo.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Home/Home.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    
  //funcion que devuelve los usuarios de la api
    Future<List<UsuarioModelo>> getUsuarios() async {    
      var data = await http.get('http://10.0.2.2:8081/todos');
      var jsonData = json.decode(data.body);
      
      List<UsuarioModelo> usuario = []; 
      for (var e in jsonData) {
        UsuarioModelo usuarios = new UsuarioModelo();
        usuarios.usuario = e["usuario"];
        usuarios.password = e["password"];
        usuario.add(usuarios);
      }
      return usuario;
    }

    String _usuario;
    String _password;
    TextEditingController firstController = TextEditingController();
    TextEditingController secondController = TextEditingController();
    List<GlobalKey<FormState>> _formKeysList= [
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
    ];
    bool _passwordVisible = false;

    //validaciones de usuario
    String validarUsuario(String value) {
      if (value.isEmpty) {
        return "Rellena el campo";
      } else if (value.length < 3) {
        return "Tiene que tener como minimo 5 caracteres";
      } else if (value.length > 10) {
        return "Tiene que tener como maximo 10 caracteres";
      } else if(value == _usuario){
        return "El usuario no existe";
      } else 
        return null;
    }

//validaciones de la contraseña
    String validarPassword(String value) {
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
    }

    return Scaffold(
       body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/fondo_01.jpg'),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 170),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/carta.png'),
                          //fit: BoxFit.cover, 
                        )
                      ),                   
                    ),
                    Container( //PRIMER CAMPO: USUARIO
                      margin: EdgeInsets.only(top: 50),
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Form(
                        autovalidate: true,
                        key: _formKeysList[0],
                        child: TextFormField(
                          controller: firstController,
                          validator: validarUsuario,
                          onSaved: (String value){
                            _usuario = value;
                          },
                          style: TextStyle(color: Colors.yellow[900], fontSize: 20),
                          decoration: InputDecoration(        
                            enabledBorder: UnderlineInputBorder(      
                              borderSide: BorderSide(color: Colors.yellow[900]),   
                            ),                
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow[900], width: 4.0),
                            ),  
                            contentPadding: EdgeInsets.only(top: 18), // add padding to adjust text
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(top: 10), // add padding to adjust icon
                              child: Icon(CupertinoIcons.person, size: 25.0, color: Colors.yellow[900],),
                            ),
                            hintText: "Usuario",
                            hintStyle: TextStyle(fontSize: 20, color: Colors.yellow[900]),
                          ),
                        ),
                      ),
                    ),
                    Container( //CUARTO CAMPO: CONTRASEÑA
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: Form(
                        autovalidate: true,
                        key: _formKeysList[1],
                        child: TextFormField(
                          obscureText: !_passwordVisible,
                          controller: secondController,
                          validator: validarPassword,
                            onSaved: (String value){
                            _password = value;
                          },
                          style: TextStyle(color: Colors.yellow[900], fontSize: 20),
                          decoration: InputDecoration(        
                            enabledBorder: UnderlineInputBorder(      
                              borderSide: BorderSide(color: Colors.yellow[900]),   
                            ),                
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow[900], width: 4.0),
                            ),  
                            contentPadding: EdgeInsets.only(top: 18), // add padding to adjust text
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(top: 10), // add padding to adjust icon
                              child: Icon(CupertinoIcons.lock, size: 25.0, color: Colors.yellow[900],),
                            ),
                            suffixIcon: IconButton(
                              icon: Padding(
                                padding: EdgeInsets.only(top: 12), // add padding to adjust icon
                                child: Icon(
                                  _passwordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                                  size: 25.0,
                                  color: Colors.yellow[900],
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                      _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            hintText: "Contraseña",
                            hintStyle: TextStyle(fontSize: 20, color: Colors.yellow[900]),
                          ),
                        ),
                      ),
                    ),
                    Container( //BOTON LOGIN
                      margin: EdgeInsets.only(top: 25),
                      child: FutureBuilder(
                        future: getUsuarios(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return RaisedButton(
                          color: Colors.yellow[900],
                          child: Text('Login', style: TextStyle(fontSize: 16, color: Colors.white54),),
                          padding: EdgeInsets.only(left: 150, right: 150),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          onPressed: () async{
                          String usuario = firstController.text;
                          String password = secondController.text;
                          int cont = 0;
                          for(int i=0; i<snapshot.data.length; i++){
                            if (_formKeysList[1].currentState.validate()) { 
                            }
                            if(snapshot.data[i].usuario == usuario && snapshot.data[i].password == password){
                                globals.usuario = usuario;
                                globals.password = password;
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Home(),
                                ));  
                            }else{
                              if(snapshot.data[i].usuario != usuario){
                                 cont ++; 
                              }
                              if(cont == snapshot.data.length){
                                  if (_formKeysList[0].currentState.validate()) { 
                                      _formKeysList[0].currentState.save();
                                    }
                              }
                              if(snapshot.data[i].password != password && snapshot.data[i].usuario == usuario){
                                if (_formKeysList[1].currentState.validate()) { 
                                  _formKeysList[1].currentState.save();
                                } 
                              }  
                            }       
                          }  
                          },
                        );
                        }
                      )
                    ),
                  ],
                ),
              ),
            )
          ]
        ),
      ), 
    );
  }
}