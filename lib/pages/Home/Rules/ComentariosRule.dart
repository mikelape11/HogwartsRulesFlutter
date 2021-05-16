import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/models/ComentariosModelo.dart';
import 'package:hogwarts_rules/models/RulesFavoritosModelo.dart';
import 'package:hogwarts_rules/widgets/custom_alert_dialog.dart';
import 'package:hogwarts_rules/models/ImagenRespuestasModelo.dart';

import 'dart:convert';
import 'RulesAPI.dart';


class ComentariosRule extends StatefulWidget {
  String id;
  String usuario;
  String avatar;
  String rule;
  String thumbUrl;
  int comentariosLength;
  List<RulesFavoritosModelo> favoritos;
  List<ComentariosModelo> comentarios;

  ComentariosRule(this.id,this.usuario,this.avatar,this.rule,this.thumbUrl,this.comentariosLength,this.favoritos,this.comentarios);

  @override
  _ComentariosRuleState createState() => _ComentariosRuleState();
}
bool _visible = false;
class _ComentariosRuleState extends State<ComentariosRule> {
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
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario , width: 1.0)),      
                    color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withRed(80),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [     
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  //image: AssetImage('${widget.snapshot.data[i].avatar}'),
                                  image: AssetImage(widget.avatar),
                                  fit: BoxFit.fitHeight,  
                                ),
                              ),
                              height: 70,
                              width: MediaQuery.of(context).size.width/4,
                            ),                   
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('${widget.usuario}', style: TextStyle(color: globals.casaHogwarts == "Gryffindor"
                                ? globals.grySecundario
                                : globals.casaHogwarts == "Slytherin"
                                    ? globals.slySecundario
                                    : globals.casaHogwarts == "Ravenclaw"
                                        ? globals.ravSecundario
                                        : globals.casaHogwarts == "Hufflepuff"
                                            ? globals.hufSecundario
                                            : globals.grySecundario,  fontWeight: FontWeight.bold, fontSize: 17), textAlign: TextAlign.start,),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              width: 280,
                              child: Text(
                                '${widget.rule}',
                                style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ), 
                           SizedBox(height: 10,), 
                              Visibility(
                                visible: widget.thumbUrl.split(',').last == "" ? _visible = false : _visible = true,
                                child: GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.all(4),
                                    height: 170,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: widget.thumbUrl.split(',').last == "" ? AssetImage("images/LOGOS/Logo3.png") : MemoryImage(base64Decode(widget.thumbUrl.split(',').last)),
                                        fit: BoxFit.fitWidth,
                                      ),  
                                    ) 
                                  ),
                                  onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CustomAlertDialog(
                                          titlePadding: EdgeInsets.all(0.0),
                                          contentPadding: EdgeInsets.all(0.0),
                                          content: Container(
                                            margin: EdgeInsets.symmetric(vertical: 10),
                                            decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: widget.thumbUrl.split(',').last == "" ? AssetImage("images/LOGOS/Logo3.png") : MemoryImage(base64Decode(widget.thumbUrl.split(',').last)),
                                              fit: BoxFit.fitWidth,
                                              ),  
                                            ),
                                            width: 320,
                                            height: 400,
                                          ),
                                        );                                                                
                                      }
                                    );
                                  },
                                ),
                              ),       
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: MediaQuery.of(context).size.width/1.5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 30),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Icon(Icons.mode_comment_outlined , color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20,),
                                        ),
                                        SizedBox(width: 10,),
                                        Container(
                                          child: Text('${widget.comentariosLength}', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontSize: 15, fontWeight: FontWeight.bold),),
                                        ),
                                      ],
                                    ),
                                  ),

                                  FutureBuilder(
                                    future: getRules(),
                                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                                      if(!snapshot.hasData)  
                                        return Center(child: CircularProgressIndicator(strokeWidth: 2));
                                      else
                                    return Container(
                                      margin: EdgeInsets.only(right: 30),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Icon(Icons.favorite_outline, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20,),
                                          ),
                                          SizedBox(width: 10,),
                                          for(int i=0; i<snapshot.data.length;i++)
                                            if(snapshot.data[i].id == widget.id)
                                          Container(
                                            child: Text('${snapshot.data[i].favoritos.length}', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontSize: 15, fontWeight: FontWeight.bold),),
                                          ),
                                        ],
                                      ),
                                    );
                                    }
                                  ),
                                ],
                              ),
                            ),                                              
                          ],
                        ),
                      ),                 
                    ],
                  ),                    
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,  width: 1.0)),      
                    color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withRed(80),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: Text('COMENTARIOS', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 18),)),
                ),
                Container(
                  height: 400,
                  child: DraggableScrollableSheet(
                    initialChildSize: 1,
                    builder: (context, scrollControler){
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            for(int i=0;i<widget.comentarios.length;i++)
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,  width: 1.0)),      
                                color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withRed(80),
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [     
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              //image: AssetImage('${widget.snapshot.data[i].avatar}'),
                                              image: AssetImage(widget.comentarios[i].avatar),
                                              fit: BoxFit.fitHeight,  
                                            ),
                                          ),
                                          height: 70,
                                          width: MediaQuery.of(context).size.width/4,
                                        ),                   
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text('${widget.comentarios[i].usuario}', style: TextStyle(color: globals.casaHogwarts == "Gryffindor"
                                            ? globals.grySecundario
                                            : globals.casaHogwarts == "Slytherin"
                                                ? globals.slySecundario
                                                : globals.casaHogwarts == "Ravenclaw"
                                                    ? globals.ravSecundario
                                                    : globals.casaHogwarts == "Hufflepuff"
                                                        ? globals.hufSecundario
                                                        : globals.grySecundario,  fontWeight: FontWeight.bold, fontSize: 17), textAlign: TextAlign.start,),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: 280,
                                          child: Text(
                                            '${widget.comentarios[i].comentario}',
                                            style: TextStyle(color: Colors.white70),
                                          ),
                                        ),                                                            
                                      ],
                                    ),
                                  ),                 
                                ],
                              ),                        
                            ),
                          ],
                        ),         
                      );
                    },                
                  ),
                ),              
              ],
            ),
          ),        
        ],                         
      ),
    );
  }
}