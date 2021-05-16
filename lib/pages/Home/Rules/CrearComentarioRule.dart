import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/models/ComentariosModelo.dart';
import 'package:hogwarts_rules/models/ImagenRespuestasModelo.dart';
import 'package:hogwarts_rules/models/RulesFavoritosModelo.dart';
import 'package:hogwarts_rules/models/RulesModelo.dart';

import '../Home.dart';
import 'Rules.dart';
import 'RulesAPI.dart';


class CrearComentarioRule extends StatefulWidget {
  String id;
  String usuario;
  String avatar;
  String rule;
  int comentariosLength;
  List<RulesFavoritosModelo> favoritos;
  List<imagenRespuestasModelo> foto;
  String thumbUrl;
  List<ComentariosModelo> comentarios;

  CrearComentarioRule(this.id,this.usuario,this.avatar,this.rule,this.comentariosLength,this.favoritos,this.foto,this.thumbUrl,this.comentarios);

  @override
  _CrearComentarioRuleState createState() => _CrearComentarioRuleState();
}

class _CrearComentarioRuleState extends State<CrearComentarioRule> {

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
  
  TextEditingController comentarioController = TextEditingController();
  RulesModelo rule;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario//change your color here
        ),
        title: Text('Comentario Rule', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
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
                      labelText: 'Escribe tu comentario',
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
                  FutureBuilder(
                    future: getRules(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if(!snapshot.hasData)  
                        return Center(child: CircularProgressIndicator(strokeWidth: 2));
                      else
                      return Container(    
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
                            RulesModelo rules = new RulesModelo();
                            RulesModelo rul = new RulesModelo();
                            ComentariosModelo comentario = new ComentariosModelo();
                            List<ComentariosModelo> coments = [];
                         
                            rules.id = widget.id;
                            rules.usuario = widget.usuario;
                            rules.avatar = widget.avatar;
                            rules.rule = widget.rule;
                            rules.foto = widget.foto;
                            rules.favoritos = widget.favoritos;

                            for(int n=0;n<snapshot.data.length; n++){
                                if(snapshot.data[n].id == widget.id){
                                   for(int m=0;m<snapshot.data[n].comentarios.length; m++){
                                      ComentariosModelo comentario2 = new ComentariosModelo();
                                      comentario2.usuario = snapshot.data[n].comentarios[m].usuario;
                                      comentario2.avatar = snapshot.data[n].comentarios[m].avatar;
                                      comentario2.comentario = snapshot.data[n].comentarios[m].comentario;
                                      coments.add(comentario2); 
                                  }
                                }
                            }
                            comentario.usuario = globals.usuario;
                            String avatar = globals.avatarElegido == "" ?  globals.avatarDefecto : globals.avatarElegido;
                            comentario.avatar = avatar;
                            comentario.comentario = comentarioController.text;

                            coments.add(comentario);
                            rules.comentarios = coments;
                            rul = await actualizarRule(rules);
                            setState(() {
                              rule = rules;
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Home(1),
                            ));
                          }
                        ),
                      );
                    }
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