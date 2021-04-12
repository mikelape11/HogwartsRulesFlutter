import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hogwarts_rules/models/OpinionModelo.dart';
import 'package:hogwarts_rules/pages/Ajustes/OpinionAPI.dart';
import 'package:hogwarts_rules/pages/Ajustes/OpinionesInfo.dart';

import 'Ajustes.dart';

class Opinion extends StatefulWidget {

  @override
  _OpinionState createState() => _OpinionState();
}

class _OpinionState extends State<Opinion> {
  
  double _rating;
  double _initialRating = 3;
  TextEditingController valoracionController = TextEditingController();
  OpinionModelo opinion;

  @override
  void initState() { 
    super.initState();
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Stack(
              children: <Widget>[
                IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                  icon: Icon(Icons.arrow_back, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 25,),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Ajustes(),
                    ));
                  }
                ),
              ],
            )
          ),
        ),
        //automaticallyImplyLeading: false,
        title: Text('Opinion', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
        backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.done_outline_rounded, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 25,),
              onPressed: () async{
                String valoracion = valoracionController.text;
                OpinionModelo opiniones = await registrarOpinion(globals.usuario, valoracion, _rating, "images/LOGOS/LogoPeque.png");
                setState(() {
                  opinion = opiniones;
                });
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Ajustes(),
                ));
              }
          ), 
        ],
        bottom: PreferredSize(
        child: Container(
          color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(4.0)),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            image: DecorationImage(
              image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoHuf}') :  AssetImage('${globals.fondoGry}'),
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
                      TextSpan(text: 'D', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 25)),
                      TextSpan(text: 'atos', style: TextStyle(fontWeight: FontWeight.bold)),
                    ] 
                  )               
                )
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  readOnly: true,
                  style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, width: 0.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, width: 2.0),
                    ),  
                    contentPadding: EdgeInsets.only(top: 22), // add padding to adjust text
                    hintText: globals.usuario,
                    hintStyle: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 17),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 15), // add padding to adjust icon
                      child: Icon(Icons.account_circle_outlined, size: 20.0, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,),
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
                      TextSpan(text: 'O', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 25)),
                      TextSpan(text: 'pinión', style: TextStyle(fontWeight: FontWeight.bold)),
                    ] 
                  )               
                )
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  child: TextField(
                    controller: valoracionController,
                    cursorColor: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, width: 0.5),
                      ),
                      focusedBorder: UnderlineInputBorder(                  
                        borderSide: BorderSide(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, width: 2.0),
                      ), 
                      labelText: 'Escribe Aquí',
                      labelStyle: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontSize: 18, fontWeight: FontWeight.bold),
                      fillColor: Colors.red,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario)
                      ),
                    ),
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
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
                      TextSpan(text: 'P', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 25)),
                      TextSpan(text: 'untuación', style: TextStyle(fontWeight: FontWeight.bold)),
                    ] 
                  )               
                )
              ),
              SizedBox(height: 20,),
              Container(
                child: RatingBar.builder(
                  initialRating: _initialRating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  unratedColor: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario.withOpacity(0.3) : globals.casaHogwarts == "Slytherin" ? globals.slySecundario.withOpacity(0.3) : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario.withOpacity(0.3) : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario.withOpacity(0.3) : globals.grySecundario.withOpacity(0.3),
                  itemCount: 5,
                  itemSize: 40.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                  updateOnDrag: true,
                ),
              ),
              SizedBox(height: 40),
              Divider(
                height: 15,
                color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(height: 10),
              SizedBox(height: 35),
              Container(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 19, color: Colors.white
                    ),
                    children: [
                      TextSpan(text: '¡M', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 50)),
                      TextSpan(text: 'uchas ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                      TextSpan(text: 'G', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 50)),
                      TextSpan(text: 'racias', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                      TextSpan(text: '!', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 50)),
                    ] 
                  )               
                )
              ),
              SizedBox(height: 20,),
              FutureBuilder(
                future: getOpiniones(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Container(
                  decoration: BoxDecoration(
                    color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario.withOpacity(0.7) : globals.casaHogwarts == "Slytherin" ? globals.slySecundario.withOpacity(0.7) : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario.withOpacity(0.7) : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario.withOpacity(0),
                    border: Border.all(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, width: 2.0),      
                  ),
                  child: RaisedButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: Colors.transparent,
                    child: Text('VER OPINIONES', style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OpinionesInfo(snapshot),
                      ));
                    }
                  ),
                );
                }
              ), 
            ],
          ),
        ),
      ),
    );
  }
}