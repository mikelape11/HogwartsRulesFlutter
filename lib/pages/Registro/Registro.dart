import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  const Registro({Key key}) : super(key: key);

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
                        // key: _formKeysList[0],
                        child: TextFormField(
                          // controller: firstController,
                          // validator: validarUsuario,
                          // onSaved: (String value){
                          //   _usuario = value;
                          // },
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
                    Container( //SEGUNDO CAMPO: NOMBRE
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
                              child: Icon(CupertinoIcons.pencil_outline, size: 25.0, color: Colors.teal[400],),
                            ),
                            hintText: "Nombre",
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
                        // key: _formKeysList[0],
                        child: TextFormField(
                          // controller: firstController,
                          // validator: validarUsuario,
                          // onSaved: (String value){
                          //   _usuario = value;
                          // },
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
                      child: Form(
                        autovalidate: true,
                        // key: _formKeysList[0],
                        child: TextFormField(
                          // controller: firstController,
                          // validator: validarUsuario,
                          // onSaved: (String value){
                          //   _usuario = value;
                          // },
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
                            hintText: "Contraseña",
                            hintStyle: TextStyle(fontSize: 20, color: Colors.teal[400]),
                          ),
                        ),
                      ),
                    ),
                    Container( //QUINTO CAMPO: CONTRASEÑA
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
                            hintText: "Repite Contraseña",
                            hintStyle: TextStyle(fontSize: 20, color: Colors.teal[400]),                         
                          ),
                        ),
                      ),
                    ),
                    Container( //BOTON LOGIN
                      margin: EdgeInsets.only(top: 25),
                      child: RaisedButton(
                        color: Colors.teal[400],
                        child: Text('Registrar', style: TextStyle(fontSize: 16, color: Colors.white54),),
                        padding: EdgeInsets.only(left: 150, right: 150),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: (){
                          print("kaixo");
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