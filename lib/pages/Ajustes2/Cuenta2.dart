import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/models/UsuarioModelo.dart';
import 'package:hogwarts_rules/pages/Ajustes2/Ajustes2.dart';
import 'package:hogwarts_rules/pages/Portada/LoginAPI.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'CuentaAPI.dart';


class Cuenta extends StatefulWidget {

  @override
  _CuentaState createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {

  String avatar = globals.avatarElegido != "images/Avatares/Avatar7.png" ?  globals.avatarElegido : globals.avatarDefecto;
  int i;
  String _usuario;
  String _email;
  Future<List<UsuarioModelo>> usuarios;
  TextEditingController usuarioController = TextEditingController(text: "${globals.usuario}");
  TextEditingController passwordController = TextEditingController(text: "${globals.password}");
  TextEditingController emailController = TextEditingController(text: "${globals.email}");
  List<GlobalKey<FormState>> _formKeysList= [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  void cambiarAvatar(i){
    setState(() {
      avatar = "images/Avatares/Avatar${i}.png";
    });
  }

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
    PageController _pageController = new PageController();
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Stack(
              children: <Widget>[
                IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                  icon: Icon(Icons.arrow_back, color: Color(globals.color2), size: 25,),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Ajustes2(),
                    ));
                  }
                ),
              ],
            )
          ),
        ),
        //automaticallyImplyLeading: false,
        title: Text('Cuenta', style: TextStyle(color: Color(globals.color2)),),
        backgroundColor: Color(globals.color1),
        centerTitle: true,
        actions: [        
          FutureBuilder(
            future: getUsuarios(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
            return IconButton(
              icon: Icon(Icons.done_outline_rounded, color: Color(globals.color2), size: 25,),
              onPressed: () async{
                String usuario = usuarioController.text;
                String email = emailController.text;
                String password = passwordController.text;
                int contador = 0;
                int contador2 = 0;
                for(int k=0; k<snapshot.data.length; k++){
                  if(avatar != globals.avatarDefecto || avatar != globals.avatarElegido){
                      globals.idUsuario = snapshot.data[k].id;
                      globals.usuario = usuarioController.text;
                      globals.email = emailController.text;
                      globals.password = passwordController.text;
                      UsuarioModelo usu = new UsuarioModelo();
                      usu.id = globals.idUsuario;
                      usu.usuario = usuarioController.text;
                      usu.email = emailController.text;
                      usu.casaHogwarts = globals.casaHogwarts;
                      usu.varita = globals.varita;
                      usu.patronus = globals.patronus;
                      usu.password = passwordController.text;
                      usu.rol = 0;
                      usu.avatar = avatar;
                      UsuarioModelo usuarios = await actualizarUsuario(usu);
                      setState(() {
                        usuario = usuarios as String;
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Ajustes2(),
                      ));
                      break;
                  }
                }
                for(int i=0; i<snapshot.data.length; i++){
                  if(globals.usuario == snapshot.data[i].usuario && globals.password == snapshot.data[i].password){
                    if(usuario == snapshot.data[i].usuario && email == snapshot.data[i].email && password == snapshot.data[i].password){            
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Ajustes2(),
                      ));
                      break;
                    }else if(usuario == snapshot.data[i].usuario && email == snapshot.data[i].email && password != snapshot.data[i].password){
                      if(snapshot.data[i].usuario == usuario){
                        _formKeysList[2].currentState.save();
                      }
                      if (_formKeysList[2].currentState.validate()) {
                        globals.idUsuario = snapshot.data[i].id;
                        globals.usuario = usuarioController.text;
                        globals.email = emailController.text;
                        globals.password = passwordController.text;
                        UsuarioModelo usu = new UsuarioModelo();
                        usu.id = globals.idUsuario;
                        usu.usuario = usuarioController.text;
                        usu.email = emailController.text;
                        usu.password = passwordController.text;
                        usu.rol = 0;
                        usu.avatar = "";
                        UsuarioModelo usuarios = await actualizarUsuario(usu);
                        setState(() {
                          usuario = usuarios as String;
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Ajustes2(),
                        ));
                        break;
                      }else{
                        print("Contrase??a no valida");
                      }
                    }else if(usuario == snapshot.data[i].usuario && email != snapshot.data[i].email && password == snapshot.data[i].password){
                        for(int m=0; m<snapshot.data.length; m++){
                          if(emailController.text == snapshot.data[m].email){
                            if (_formKeysList[1].currentState.validate()) { 
                              _formKeysList[1].currentState.save();
                            }
                          }else if(emailController.text != snapshot.data[m].email){
                            contador2++;
                            if(contador2 == snapshot.data.length){
                              if (_formKeysList[1].currentState.validate()) { 
                                globals.idUsuario = snapshot.data[i].id;
                                globals.usuario = usuarioController.text;
                                globals.email = emailController.text;
                                globals.password = passwordController.text;
                                UsuarioModelo usu = new UsuarioModelo();
                                usu.id = globals.idUsuario;
                                usu.usuario = usuarioController.text;
                                usu.email = emailController.text;
                                usu.password = passwordController.text;
                                usu.rol = 0;
                                usu.avatar = "";
                                UsuarioModelo usuarios = await actualizarUsuario(usu);
                                setState(() {
                                  usuario = usuarios as String;
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Ajustes2(),
                                ));
                              }                                 
                            }
                          }   
                        
                        }
                    }else{
                      for(int n=0; n<snapshot.data.length; n++){                             
                        if(usuarioController.text == snapshot.data[n].usuario){
                          if (_formKeysList[0].currentState.validate()) { 
                            _formKeysList[0].currentState.save();
                          }
                        }else if(usuarioController.text != snapshot.data[n].usuario){
                          contador++;
                          if(contador == snapshot.data.length){
                            if (_formKeysList[0].currentState.validate()) { 
                              globals.idUsuario = snapshot.data[i].id;
                              globals.usuario = usuarioController.text;
                              globals.email = emailController.text;
                              globals.password = passwordController.text;
                              UsuarioModelo usu = new UsuarioModelo();
                              usu.id = globals.idUsuario;
                              usu.usuario = usuarioController.text;
                              usu.email = emailController.text;
                              usu.password = passwordController.text;
                              usu.rol = 0;
                              usu.avatar = "";
                              UsuarioModelo usuarios = await actualizarUsuario(usu);
                              setState(() {
                                usuario = usuarios as String;
                              });
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Ajustes2(),
                              ));
                            }                                 
                          }
                        }
                      }
                    }
                  }
                }
 
              }
            );
            }
          ),
        ],
        bottom: PreferredSize(
        child: Container(
          color: Color(globals.color2),
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(4.0)),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            image: DecorationImage(
              image:  AssetImage('images/fondoNegro3.png'),
              fit: BoxFit.fitWidth,  
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/1.124,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Container(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 19, color: Colors.white
                    ),
                    children: [
                      TextSpan(text: 'D', style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 25)),
                      TextSpan(text: 'atos', style: TextStyle(fontWeight: FontWeight.bold)),
                    ] 
                  )               
                )
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  autovalidate: true,
                  key: _formKeysList[0],
                  child: TextFormField(
                    controller: usuarioController,
                    validator: validarUsuario,
                    onSaved: (String value){
                      _usuario = value;
                    },
                    style: TextStyle(color: Color(globals.color2)),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(globals.color2), width: 0.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(globals.color2), width: 2.0),
                      ),  
                      contentPadding: EdgeInsets.only(top: 22), // add padding to adjust text
                      hintText: "Usuario",
                      hintStyle: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 17),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 15), // add padding to adjust icon
                        child: Icon(Icons.account_circle_outlined, size: 20.0, color: Color(globals.color2),),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  autovalidate: true,
                  key: _formKeysList[1],
                  child: TextFormField(
                    controller: emailController,
                    validator: validarEmail,
                    onSaved: (String value2){
                      _email = value2;
                    },
                    style: TextStyle(color: Color(globals.color2)),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(globals.color2), width: 0.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(globals.color2), width: 2.0),
                      ),  
                      contentPadding: EdgeInsets.only(top: 22), // add padding to adjust text
                      hintText: "Email",
                      hintStyle: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 17),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 15), // add padding to adjust icon
                        child: Icon(Icons.account_circle_outlined, size: 20.0, color: Color(globals.color2),),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  autovalidate: true,
                   key: _formKeysList[2],
                  child: TextFormField(
                    controller: passwordController,
                     validator: MultiValidator([
                      RequiredValidator(errorText: "Rellena el campo"),
                      MinLengthValidator(8,errorText: "Tiene que tener como minimo 8 caracteres"),
                      MaxLengthValidator(12,errorText: "Tiene que tener como maximo 12 caracteres"), 
                    ]),
                    style: TextStyle(color: Color(globals.color2)),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(globals.color2), width: 0.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(globals.color2), width: 2.0),
                      ),  
                      contentPadding: EdgeInsets.only(top: 22), // add padding to adjust text
                      hintText: "Password",
                      hintStyle: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 17),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 15), // add padding to adjust icon
                        child: Icon(Icons.account_circle_outlined, size: 20.0, color: Color(globals.color2),),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 19, color: Colors.white
                    ),
                    children: [
                      TextSpan(text: 'A', style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 25)),
                      TextSpan(text: 'vatar', style: TextStyle(fontWeight: FontWeight.bold)),
                    ] 
                  )               
                )
              ),
              Container(
                height: 210,
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 85.0, 
                        backgroundColor: Color(globals.color2),            
                        child: CircleAvatar(
                          radius: 80.0,
                          backgroundColor: Color(globals.color1),
                          backgroundImage: AssetImage(avatar),   
                          // backgroundImage: globals.existeAvatar
                          // ? AssetImage("images/perfil.png") 
                          // : FileImage(File(globals.avatar))
                        )            
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 19, color: Colors.white
                    ),
                    children: [
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.only(right: 50),
                          child: Icon(Icons.arrow_back, size: 25, color: Color(globals.color2),)
                        ),
                      ),
                      TextSpan(text: 'E', style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 25)),
                      TextSpan(text: 'lige tu Avatar', style: TextStyle(fontWeight: FontWeight.bold)),
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.only(left: 50),
                          child: Icon(Icons.arrow_forward, size: 25, color: Color(globals.color2),)
                        ),
                      ),
                    ] 
                  )               
                )
              ),
              SizedBox(height: 15),
              Container(
                child: CarouselSlider(
                   options: CarouselOptions(
                    height: 100.0,
                    viewportFraction: 0.25,
                ),
                  
                  items: [
                    for(var i=1; i<10; i++)        
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage('images/Avatares/Avatar${i}.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      onTap: (){
                        cambiarAvatar(i); 
                      },
                    ),
                  ],
                ),
              ),       
            ],
          ),
        ),
      ),
    );
  }
}