import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/models/ComentariosModelo.dart';
import 'package:hogwarts_rules/models/RulesFavoritosModelo.dart';
import 'package:hogwarts_rules/models/RulesModelo.dart';
import 'package:hogwarts_rules/pages/Home/Rules/ComentariosRule.dart';
import 'package:hogwarts_rules/pages/Home/Rules/CrearComentarioRule.dart';
import 'package:hogwarts_rules/widgets/custom_alert_dialog.dart';
import 'dart:convert';
import 'RulesAPI.dart';

class Rules extends StatefulWidget {
  const Rules({Key key}) : super(key: key);

  @override
  _RulesState createState() => _RulesState();
}
bool _visible = false;

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRules(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData)  
          return Center(child: CircularProgressIndicator(strokeWidth: 2));
        else
        return Container(     
          height: MediaQuery.of(context).size.height/1.22,
          child: ListView(
            children: [
              for(int i=0;i<snapshot.data.length;i++)
                if(snapshot.data[i].rol == 1)
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    //image: AssetImage('${widget.snapshot.data[i].avatar}'),
                                    image: AssetImage("images/admin.png"),
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
                                child: Text('ADMIN', style: TextStyle(color: globals.casaHogwarts == "Gryffindor"
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
                                  '${snapshot.data[i].rule}',
                                  style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),  
                            ],
                          ),
                        ),
                      ],
                    ),                    
                  ),
                for(int i=0;i<snapshot.data.length;i++)
                  if(snapshot.data[i].rol == 0)
                    GestureDetector(
                      child: Container(
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
                                        image: AssetImage(snapshot.data[i].avatar),
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
                                    child: Text('${snapshot.data[i].usuario}', style: TextStyle(color: globals.casaHogwarts == "Gryffindor"
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
                                      '${snapshot.data[i].rule}',
                                      style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 10,), 
                                  Visibility(
                                    visible: snapshot.data[i].foto == "" ? _visible = false : _visible = true,
                                    child: GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.all(4),
                                        height: 170,
                                        width: 250,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: snapshot.data[i].foto == "" ? AssetImage("images/LOGOS/Logo3.png") : MemoryImage(base64Decode(snapshot.data[i].foto)),
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
                                                  image: snapshot.data[i].foto == "" ? AssetImage("images/LOGOS/Logo3.png") : MemoryImage(base64Decode(snapshot.data[i].foto)),
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
                                  //SizedBox(height: 10,),            
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
                                              GestureDetector(
                                                child: Container(
                                                  child: Icon(Icons.mode_comment_outlined , color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20,),
                                                ),
                                                onTap: (){
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (context) => CrearComentarioRule(snapshot.data[i].id, snapshot.data[i].usuario, snapshot.data[i].avatar, snapshot.data[i].rule, snapshot.data[i].comentarios.length, snapshot.data[i].favoritos, snapshot.data[i].foto, snapshot.data[i].comentarios),
                                                  ));
                                                },
                                              ),
                                              SizedBox(width: 10,),
                                              Container(
                                                child: Text('${snapshot.data[i].comentarios.length}', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontSize: 15, fontWeight: FontWeight.bold),),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 30),
                                          child: Row(
                                            children: [ 
                                             
                                              LikeWidget(snapshot.data[i]),
                                                
                                            ],
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
                      ),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ComentariosRule(snapshot.data[i].id, snapshot.data[i].usuario, snapshot.data[i].avatar, snapshot.data[i].rule,snapshot.data[i].foto, snapshot.data[i].comentarios.length, snapshot.data[i].favoritos, snapshot.data[i].comentarios),
                        ));
                      },
                    ),            
                  ],          
          ),          
        );
        }
    );
  }
}

class LikeWidget extends StatefulWidget {
  RulesModelo snapshot;
  LikeWidget(this.snapshot);

  @override
  State<StatefulWidget> createState() {
    return _LikeWidgetState();
  }
}

class _LikeWidgetState extends State<LikeWidget> {
  
  bool fav = false;
  int contFavs = 0;
  RulesModelo rule;
  int cont = 0;

    Icon _iconoFav(){ //CAMBIO EL ICONO DEPENDIENDO DEL TEMA
        if(fav == false) {
          return Icon(Icons.favorite_outline,color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20);
        } else {
          return Icon(Icons.favorite,color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20);
        }
      }

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        FutureBuilder(
          future: getRules(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(!snapshot.hasData)  
              return Center(child: CircularProgressIndicator(strokeWidth: 2));
            else
              for(int j=0; j<snapshot.data.length; j++){
                if(snapshot.data[j].id == widget.snapshot.id){
                  for(int i=0; i<snapshot.data[j].favoritos.length; i++){
                    if(snapshot.data[j].favoritos[i].usuario == globals.usuario){
                      fav = true;
                      cont++;
                      if(cont == 2){
                        fav = false;
                      }
                    }
                  }
                }
              }   
         return Container(
            child: IconButton(
              icon: _iconoFav(), 
              onPressed: () {
                setState(() async {
                  if(fav == true){
                    // FutureBuilder(
                    //   future: getRules(),
                    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                    //     if(!snapshot.hasData)  
                    //       return Center(child: CircularProgressIndicator(strokeWidth: 2));
                    //     else
                    //     for(int j=0; j<snapshot.data.length; j++){
                    //       if(snapshot.data[j].id == widget.snapshot.id){
                    //         for(int i=0; i<snapshot.data[j].favoritos.length; i++){
                    //           if(snapshot.data[j].favoritos[i].usuario == globals.usuario){
                    //             print("entra2");
                    //             fav = true;
                    //           }else{
                    //              print("entra3");
                    //             fav = false;
                    //           }
                    //         }
                    //       }
                        
                    //     }
                    //   });
                      List<RulesFavoritosModelo> favs = new List<RulesFavoritosModelo>();
                      RulesFavoritosModelo favorito = new RulesFavoritosModelo();
                      favorito.usuario = globals.usuario;
                      favs.add(favorito);
                      await deleteLikeFavoritos(widget.snapshot.id, favs);
                      setState(() {
                        fav = false;
                        contFavs--;
                      });
                   
                  }else{
                      RulesModelo rules = new RulesModelo();
                      RulesModelo rul = new RulesModelo();
                      rules.id = widget.snapshot.id;
                      rules.usuario = widget.snapshot.usuario;
                      rules.avatar = widget.snapshot.avatar;
                      rules.rule = widget.snapshot.rule;
                      rules.foto = widget.snapshot.foto;
                      List<RulesFavoritosModelo> lista = [];
                      RulesFavoritosModelo favs = new RulesFavoritosModelo();
                      for(int i=0; i<widget.snapshot.favoritos.length;i++){
                        RulesFavoritosModelo favs2 = new RulesFavoritosModelo();
                        if(widget.snapshot.favoritos[i].usuario != globals.usuario){
                          favs2.usuario = widget.snapshot.favoritos[i].usuario;
                          lista.add(favs2);
                        }  
                      }
                      favs.usuario = globals.usuario;
                      lista.add(favs);
                      rules.favoritos = lista;
                      rules.comentarios = widget.snapshot.comentarios;
                      rul = await actualizarRule(rules);
                      setState(() {
                        fav = true;    
                        contFavs++;
                        rule = rul;
                      });      
                  }                            
                });
              
              },
            ),
           
        );
          },
         ),
        Container(
          child: Text('${widget.snapshot.favoritos.length+contFavs}', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontSize: 15, fontWeight: FontWeight.bold),),
        )
      ]
    );
  }
}

