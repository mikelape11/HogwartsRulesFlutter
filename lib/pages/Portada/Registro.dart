import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hogwarts_rules/pages/Home2/Home2.dart';
import 'package:hogwarts_rules/pages/Portada/RegistroAPI.dart';

import '../../models/UsuarioModelo.dart';
import '../Test/PortadaTest.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {

  
  String _usuario;
  String _nombre;
  String _email;
  String _password;
  TextEditingController usuarioController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<GlobalKey<FormState>> _formKeysList= [
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
    ];
  UsuarioModelo usuario;
  bool _passwordVisible = false;

  //validaciones del usuario
    String validarUsuario(String value) {
      if (value.isEmpty) {
        return "Rellena el campo";
      } else if (value.length < 5) {
        return "Tiene que tener como minimo 5 caracteres";
      } else if (value.length > 10) {
        return "Tiene que tener como maximo 10 caracteres";
      } else if(value == _usuario){
        return "El usuario ya existe";
      } else 
        return null;
    }

  //validaciones del email
    String validarEmail(String value2) {
      if (value2.isEmpty) {
        return "Rellena el campo";
      } else if(value2 == _email){
        return "El email ya existe";
      } else 
        return null;
    }
    
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Registrate con",
          style: TextStyle(
            fontSize: 16,
            color: Color(globals.color1),
            height: 2,
          ),
        ),
        Text(
          "HOGWARTS RULES",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(globals.color1),
            height: 1,
            letterSpacing: 2,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Form(
          autovalidate: true,
          key: _formKeysList[0],
          child: TextFormField(
            controller: usuarioController,
            validator: validarUsuario,
            onSaved: (String value){
              _usuario = value;
            },
            style: TextStyle(color: Color(globals.color1), fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: "Usuario",
              hintStyle: TextStyle(
                fontSize: 16,
                color: Color(globals.color4),
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 0, style: BorderStyle.none),
              ),
              filled: true,
              fillColor: Colors.yellow[700].withOpacity(0.5),
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
            controller: emailController,
            validator: validarEmail,
            onSaved: (String value2){
              _email = value2;
            },
            style: TextStyle(color: Color(globals.color1), fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(
                fontSize: 16,
                color: Color(globals.color4),
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 0, style: BorderStyle.none),
              ),
              filled: true,
              fillColor: Colors.yellow[700].withOpacity(0.5),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            )
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Form(
          autovalidate: true, //comprueba validacion a tiempo real
          child: TextFormField(
            obscureText: !_passwordVisible,
            controller: passwordController,
            validator: MultiValidator([
              RequiredValidator(errorText: "Rellena el campo"),
              MinLengthValidator(8,errorText: "Tiene que tener como minimo 8 caracteres"),
              MaxLengthValidator(12,errorText: "Tiene que tener como maximo 12 caracteres"), 
            ]),
            style: TextStyle(color: Color(globals.color1), fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(
                fontSize: 16,
                color: Color(globals.color4),
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(width: 0, style: BorderStyle.none),
              ),
              filled: true,
              fillColor: Colors.yellow[700].withOpacity(0.5),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                    size: 25.0,
                    color: Color(globals.color1),
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
                color: Color(globals.color1).withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0,3),
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
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25)),
                color: Color(globals.color2),
                child: Text(
                  "REGISTRO",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(globals.color1),
                  ),
                ),
                onPressed: () async{
                  String usuario = usuarioController.text;
                  String email = emailController.text;
                  String password = passwordController.text;
                  int cont = 0;
                  for(int i=0; i<snapshot.data.length; i++){
                    //print(snapshot.data[i].usuario);
                    if(snapshot.data[i].usuario == usuario || snapshot.data[i].email == email){
                      _formKeysList[0].currentState.save();
                        _formKeysList[1].currentState.save();
                      
                    }else{
                      if (_formKeysList[0].currentState.validate() && _formKeysList[1].currentState.validate()) {
                          cont ++; 
                          globals.usuario = usuario;
                          globals.email = email;
                          globals.password = password;
                      } else {
                        print("Not Validated");        
                      }                
                    }
                    if(cont == snapshot.data.length){
                      UsuarioModelo usuarios = await registrarUsuario(usuario, password, email);
                      setState(() {
                        usuario = usuarios as String;
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Home2(),
                      ));  
                    }
                  }  
                },
              );
              }
            )
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "O registrate con",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(globals.color1),
            height: 1,
          )
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Entypo.facebook_with_circle,
              size: 32,
              color: Color(globals.color1),
            ),
            SizedBox(
              width: 16,
            ),
            Icon(
              Entypo.twitter_with_circle,
              size: 32,
              color: Color(globals.color1),
            ),
            SizedBox(
              width: 16,
            ),
            Icon(
              Entypo.google__with_circle,
              size: 32,
              color: Color(globals.color1),
            ),
          ],
        ),
      ],
    );
  }
}