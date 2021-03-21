import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_rules/pages/Home/Home.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                        // key: _formKeysList[0],
                        child: TextFormField(
                          // controller: firstController,
                          // validator: validarUsuario,
                          // onSaved: (String value){
                          //   _usuario = value;
                          // },
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
                        // key: _formKeysList[0],
                        child: TextFormField(
                          // controller: firstController,
                          // validator: validarUsuario,
                          // onSaved: (String value){
                          //   _usuario = value;
                          // },
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
                            hintText: "Contraseña",
                            hintStyle: TextStyle(fontSize: 20, color: Colors.yellow[900]),
                          ),
                        ),
                      ),
                    ),
                    Container( //BOTON LOGIN
                      margin: EdgeInsets.only(top: 25),
                      child: RaisedButton(
                        color: Colors.yellow[900],
                        child: Text('LOGIN', style: TextStyle(fontSize: 16, color: Colors.white54, fontWeight: FontWeight.bold),),
                        padding: EdgeInsets.only(left: 150, right: 150),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: (){
                          print("kaixo");
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                        },
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