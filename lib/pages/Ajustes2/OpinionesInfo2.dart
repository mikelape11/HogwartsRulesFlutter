import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/models/OpinionModelo.dart';
import 'package:hogwarts_rules/pages/Ajustes/Ajustes.dart';

import 'Ajustes2.dart';


class OpinionesInfo2 extends StatefulWidget {
  final AsyncSnapshot snapshot;

  OpinionesInfo2(this.snapshot);

  @override
  _OpinionesInfo2State createState() => _OpinionesInfo2State();
}
OpinionModelo opinion;

class _OpinionesInfo2State extends State<OpinionesInfo2> {

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
        title: Text('Opiniones', style: TextStyle(color: Color(globals.color2)),),
        backgroundColor: Color(globals.color1),
        centerTitle: true,
        actions: [      
          IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(Icons.settings_outlined, color: Color(globals.color2), size: 25,),
            onPressed: () {
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/fondoNegro3.png'),
                fit: BoxFit.fitWidth,  
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: ListView(
              children: [
                SizedBox(height: 10,),
                for(int i=0; i<widget.snapshot.data.length; i++)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    elevation: 30,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    color: Color(globals.color1),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:  AssetImage('${widget.snapshot.data[i].avatar}'),
                                  fit: BoxFit.fitHeight,  
                                ),
                              ),
                              height: 70,
                              width: MediaQuery.of(context).size.width/4,
                            ),
                            Container(
                              child: Text("${widget.snapshot.data[i].usuario}", style: TextStyle(fontSize: 17, color: Colors.white70, fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(height: 5,),
                            Container(
                               margin: EdgeInsets.only(bottom: 10),
                              child: RatingBar.builder(
                                initialRating: widget.snapshot.data[i].puntuacion,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                unratedColor: Color(globals.color4),
                                itemCount: 5,
                                itemSize: 12.0,
                                itemPadding: EdgeInsets.symmetric(horizontal: 0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Color(globals.color2),
                                ),
                              ),
                            ),
                            ],
                          ),                         
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            width: MediaQuery.of(context).size.width/1.5,
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text("${widget.snapshot.data[i].valoracion}", style: TextStyle(fontSize: 17, color: Colors.white70, fontWeight: FontWeight.bold),),
                                ),                             
                              ],
                            ),
                          ),
                        ],                       
                      ),                    
                    ),
                  ),
                ),   
              ],          
            ),
          )
        ] 
      ),
    );
  }
}