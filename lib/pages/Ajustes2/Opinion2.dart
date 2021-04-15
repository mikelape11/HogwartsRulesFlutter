import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hogwarts_rules/pages/Ajustes/OpinionAPI.dart';
import 'package:hogwarts_rules/models/OpinionModelo.dart';
import 'package:hogwarts_rules/pages/Ajustes/OpinionesInfo.dart';

import 'Ajustes2.dart';
import 'OpinionesInfo2.dart';

class Opinion2 extends StatefulWidget {

  @override
  _OpinionState createState() => _OpinionState();
}

class _OpinionState extends State<Opinion2> {
  
  double _rating;
  double _initialRating = 2.0;
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
        title: Text('Opinion', style: TextStyle(color: Color(globals.color2)),),
        backgroundColor: Color(globals.color1),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.done_outline_rounded, color: Color(globals.color2), size: 25,),
              onPressed: () async{
                String valoracion = valoracionController.text;
                String avatar = globals.avatarElegido != "images/Avatares/Avatar7.png" ? globals.avatarElegido : globals.avatarDefecto;
                OpinionModelo opiniones = await registrarOpinion(globals.usuario, valoracion, _rating, avatar);
                setState(() {
                  opinion = opiniones;
                });
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Ajustes2(),
                ));
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
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  readOnly: true,
                  style: TextStyle(color: Color(globals.color2)),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(globals.color2), width: 0.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(globals.color2), width: 2.0),
                    ),  
                    contentPadding: EdgeInsets.only(top: 22), // add padding to adjust text
                    hintText: globals.usuario,
                    hintStyle: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 17),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 15), // add padding to adjust icon
                      child: Icon(Icons.account_circle_outlined, size: 20.0, color: Color(globals.color2),),
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
                      TextSpan(text: 'O', style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 25)),
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
                    cursorColor: Color(globals.color2),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(globals.color2), width: 0.5),
                      ),
                      focusedBorder: UnderlineInputBorder(                  
                        borderSide: BorderSide(color: Color(globals.color2), width: 2.0),
                      ), 
                      labelText: 'Escribe Aquí',
                      labelStyle: TextStyle(color: Color(globals.color2), fontSize: 18, fontWeight: FontWeight.bold),
                      fillColor: Colors.red,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(globals.color2))
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
                      TextSpan(text: 'P', style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 25)),
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
                  unratedColor: Color(globals.color2).withOpacity(0.3),
                  itemCount: 5,
                  itemSize: 40.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Color(globals.color2),
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
                color: Color(globals.color2),
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
                      TextSpan(text: '¡M', style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 50)),
                      TextSpan(text: 'uchas ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                      TextSpan(text: 'G', style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 50)),
                      TextSpan(text: 'racias', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                      TextSpan(text: '!', style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 50)),
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
                    color: Color(globals.color1),
                    border: Border.all(color: Color(globals.color2), width: 2.0),      
                  ),
                  child: RaisedButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: Colors.transparent,
                    child: Text('VER OPINIONES', style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OpinionesInfo2(snapshot),
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