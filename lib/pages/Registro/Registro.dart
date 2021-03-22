
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_rules/models/UsuarioModelo.dart';
import 'package:hogwarts_rules/pages/Registro/RegistroAPI.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:form_field_validator/form_field_validator.dart';

import '../Home/Home.dart';

class Registro extends StatefulWidget {
  const Registro({Key key}) : super(key: key);

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
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          autovalidate: true, //comprueba validacion a tiempo real
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/fondo_03.jpg'),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: 120),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:  AssetImage('images/hat.png'),
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
                              controller: usuarioController,
                              validator: validarUsuario,
                              onSaved: (String value){
                                _usuario = value;
                              },
                              style: TextStyle(color: Colors.teal[400], fontSize: 20),
                              decoration: InputDecoration(        
                                enabledBorder: UnderlineInputBorder(      
                                  borderSide: BorderSide(color: Colors.teal[400]),   
                                ),                
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal[400], width: 4.0),
                                ),  
                                contentPadding: EdgeInsets.only(top: 18), // add padding to adjust text
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(top: 10), // add padding to adjust icon
                                  child: Icon(CupertinoIcons.person, size: 25.0, color: Colors.teal[400],),
                                ),
                                hintText: "Usuario",
                                hintStyle: TextStyle(fontSize: 20, color: Colors.teal[400]),
                              ),
                            ),
                          ),
                      ),
                      Container( //TECER CAMPO: EMAIL
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.only(left: 40, right: 40),
                          child: Form(
                            autovalidate: true,
                            key: _formKeysList[1],
                            child: TextFormField(
                              controller: emailController,
                              validator: validarEmail,
                              onSaved: (String value2){
                                _email = value2;
                              },
                              style: TextStyle(color: Colors.teal[400], fontSize: 20),
                              decoration: InputDecoration(        
                                enabledBorder: UnderlineInputBorder(      
                                  borderSide: BorderSide(color: Colors.teal[400]),   
                                ),                
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal[400], width: 4.0),
                                ),  
                                contentPadding: EdgeInsets.only(top: 18), // add padding to adjust text
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(top: 10), // add padding to adjust icon
                                  child: Icon(CupertinoIcons.mail, size: 25.0, color: Colors.teal[400],),
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(fontSize: 20, color: Colors.teal[400]),
                              ),
                            ),
                          ),
                      ),
                      Container( //CUARTO CAMPO: CONTRASEÑA
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            obscureText: !_passwordVisible,
                            controller: passwordController,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Rellena el campo"),
                              MinLengthValidator(8,errorText: "Tiene que tener como minimo 8 caracteres"),
                              MaxLengthValidator(12,errorText: "Tiene que tener como maximo 12 caracteres"), 
                          ]),
                            style: TextStyle(color: Colors.teal[400], fontSize: 20),
                            decoration: InputDecoration(        
                              enabledBorder: UnderlineInputBorder(      
                                borderSide: BorderSide(color: Colors.teal[400]),   
                              ),                
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal[400], width: 4.0),
                              ),  
                              contentPadding: EdgeInsets.only(top: 18), // add padding to adjust text
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 10), // add padding to adjust icon
                                child: Icon(CupertinoIcons.lock, size: 25.0, color: Colors.teal[400],),
                              ),
                              suffixIcon: IconButton(
                              icon: Padding(
                                padding: EdgeInsets.only(top: 12), // add padding to adjust icon
                                child: Icon(
                                  _passwordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                                  size: 25.0,
                                  color: Colors.cyan,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                      _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              hintText: "Contraseña",
                              hintStyle: TextStyle(fontSize: 20, color: Colors.teal[400]),
                            ),
                          ),
                          
                      ),
                      Container( //BOTON LOGIN
                        margin: EdgeInsets.only(top: 25),
                        child: FutureBuilder(
                          future: getUsuarios(),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            return RaisedButton(
                              color: Colors.teal[400],
                              child: Text('Registrar', style: TextStyle(fontSize: 16, color: Colors.white54),),
                              padding: EdgeInsets.only(left: 150, right: 150),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              onPressed: () async {
                                String usuario = usuarioController.text;
                                String email = emailController.text;
                                String password = passwordController.text;
                                int cont = 0;
                                for(int i=0; i<snapshot.data.length; i++){
                                  //print(snapshot.data[i].usuario);
                                  if(snapshot.data[i].usuario == usuario || snapshot.data[i].email == email){
                                    _formKeysList[0].currentState.save();
                                      print("aaaaa");
                                      _formKeysList[1].currentState.save();
                                    
                                  }else{
                                    if (_formKeysList[0].currentState.validate() && _formKeysList[1].currentState.validate()) {
                                        cont ++; 
                                        globals.usuario = usuario;
                                        globals.email = email;
                                    } else {
                                      print("Not Validated");        
                                    }                
                                  }
                                  if(cont == snapshot.data.length){
                                  UsuarioModelo usuarios = await registrarUsuario(usuario, password, email);
                                  usuarioController.text = '';
                                  emailController.text = '';
                                  passwordController.text = '';
                                  setState(() {
                                    usuario = usuarios as String;
                                  });
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ));  
                                }
                                }
                              }
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
      ), 
    );
  }
}