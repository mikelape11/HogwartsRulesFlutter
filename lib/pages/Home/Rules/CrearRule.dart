
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/models/ComentariosModelo.dart';
import 'package:hogwarts_rules/models/RulesFavoritosModelo.dart';
import 'package:hogwarts_rules/models/RulesModelo.dart';
import 'package:hogwarts_rules/pages/Home/Rules/RulesAPI.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as Io;
import '../Home.dart';
import 'dart:convert';

class CrearRule extends StatefulWidget {

  @override
  _CrearRuleState createState() => _CrearRuleState();
}

class _CrearRuleState extends State<CrearRule> {
  @override
  void initState() { 
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.show');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
  File _image;
  bool imagenElegida = false;

  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );
    setState(() {
      _image = image;
    });
  }

  TextEditingController comentarioController = TextEditingController();
  TextEditingController fotoController = TextEditingController();
  RulesModelo rule;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario//change your color here
        ),
        title: Text('Rule', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
        backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
        centerTitle: true,
        bottom: PreferredSize(
        child: Container(
          color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(4.0)),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
              // image: DecorationImage(
              //   image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoHuf}') :  AssetImage('${globals.fondoGry}'),
              //   fit: BoxFit.fitWidth,  
                
              // ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  child: TextField(
                    controller: comentarioController,
                    cursorColor: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(                  
                        borderSide: BorderSide(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, width: 2.0),
                      ), 
                      labelText: '¿Qué está pasando?',
                      labelStyle: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontSize: 18, fontWeight: FontWeight.bold),
                      fillColor: Colors.red,
                      counterStyle: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),
                    ),
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    maxLength: 250, 
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                         decoration: BoxDecoration(
                          color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withOpacity(0.9),
                          border: Border.all(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        width: 80,
                        height: 80,
                        child: imagenElegida == false ? Icon(Icons.add, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 30,
                        ) : Container(
                            decoration: BoxDecoration(
                            border: Border.all(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image.file(
                          _image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.fitHeight,
                      ),
                        ),
                      ),
                      onTap: () async{
                      _imgFromGallery();
                      final bytes = await Io.File(_image.path).readAsBytes();
                      String img64 = base64Encode(bytes);
                      print(img64);
                      fotoController.text = img64;
                      setState(() {
                        imagenElegida = true;
                      });
                    },
                    ),
                  ],
                ),
              ), 
              SizedBox(height: 20,),       
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(    
                    margin: EdgeInsets.symmetric(horizontal: 15),                     
                    child: RaisedButton(   
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),  
                      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 30),                     
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withRed(100),
                      child: Text('CANCELAR', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontSize: 18),),
                      onPressed: () async{
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Home(1),
                        ));
                      }
                    ),
                  ),
                  Container(    
                    margin: EdgeInsets.symmetric(horizontal: 15),                     
                    child: RaisedButton(   
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),  
                      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 30),                     
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withRed(100),
                      child: Text('PUBLICAR', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontSize: 18),),
                      onPressed: () async{
                        RulesModelo rules;
                        // ComentariosModelo comentario;
                        // comentario.usuario = "";
                        // comentario.comentario = "";
                        List<ComentariosModelo> coments = [];
                        //coments.add(comentario);
                        String avatar = globals.avatarElegido == "" ?  globals.avatarDefecto : globals.avatarElegido;
                        RulesFavoritosModelo rulesFavs = new RulesFavoritosModelo();
                        List<RulesFavoritosModelo> lista = [];
                        // rulesFavs.usuario = globals.usuario;
                        // lista.add(rulesFavs);
                        rules = await registrarRule(globals.usuario,avatar, 0, comentarioController.text, fotoController.text, coments, lista);
                        setState(() {
                          rule = rules;
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Home(1),
                        ));
                      }
                    ),
                  ),
                ] 
              ), 
            ],
          ),   
          
        ],                         
      ),
    );
  }
}