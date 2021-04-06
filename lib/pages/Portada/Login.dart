import 'package:flutter/material.dart';
import 'package:hogwarts_rules/pages/Home2/Home2.dart';
import 'package:hogwarts_rules/pages/Portada/LoginAPI.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Home/Home.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          SizedBox(
            height: 40,
          ),
          Text(
            "Bienvenid@ a",
            style: TextStyle(
              fontSize: 16,
              color: Color(globals.color2),
              height: 2,
            )
          ),
           SizedBox(
            height: 10,
          ),
          Text(
            "HOGWARTS RULES",
            style: TextStyle(
              fontSize: 32,
              color: Color(globals.color2),
              height: 1,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            )
          ),
          SizedBox(height: 5),
          Text(
            "Inicia Sesión para continuar",
            style: TextStyle(
              fontSize: 16,
              color: Color(globals.color2),
              height: 1,
            )
          ),
          SizedBox(
            height: 24,
          ),
          Form(
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
                hintText: "Usuario",
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
          SizedBox(
            height: 16,
          ),
          Form(
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
          SizedBox(
            height: 24,
          ),
          Container(
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
                color: Color(globals.color2),
                borderRadius: BorderRadius.all(
                  Radius.circular(25)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(globals.color2).withOpacity(0.2),
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
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25)),
                  color: Color(globals.color1),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(globals.color2),
                    ),
                  ),
                  onPressed: () async{
                  String usuario = firstController.text;
                  String password = secondController.text;
                  int cont = 0;
                  for(int i=0; i<snapshot.data.length; i++){
                    if (_formKeysList[1].currentState.validate()) { 
                    }
                    if(snapshot.data[i].usuario == usuario && snapshot.data[i].password == password && snapshot.data[i].rol == 0){
                        globals.usuario = usuario;
                        globals.password = password;
                        globals.email = snapshot.data[i].email;
                        if(snapshot.data[i].casaHogwarts == ""){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Home2(),
                          )); 
                        }else{
                          globals.casaHogwarts = snapshot.data[i].casaHogwarts;
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Home(2),
                          )); 
                        }
                         
                    }else{
                      if(snapshot.data[i].usuario != usuario || snapshot.data[i].rol != 0){
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
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "HAS OLVIDADO LA CONTRASEÑA?",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(globals.color2),
              height: 1,
            ),
          ),
          SizedBox(
            height: 16,
          ),       
        ]
      ),
    );
  }
}