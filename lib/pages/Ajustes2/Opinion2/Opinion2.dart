import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Opinion2 extends StatefulWidget {

  @override
  _OpinionState createState() => _OpinionState();
}

class _OpinionState extends State<Opinion2> {
  
  double _rating;
  double _initialRating = 2.0;
  @override
  void initState() { 
    super.initState();
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: globals.grySecundario, //change your color here
        ),
        //automaticallyImplyLeading: false,
        title: Text('Opinion', style: TextStyle(color: globals.grySecundario),),
        backgroundColor: globals.gryPrincipal,
        centerTitle: true,
        bottom: PreferredSize(
        child: Container(
          color: globals.grySecundario,
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(4.0)),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            image: DecorationImage(
              image:  AssetImage('images/Gryffindor/gryffindor.png'),
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
                      TextSpan(text: 'D', style: TextStyle(color: globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 25)),
                      TextSpan(text: 'atos', style: TextStyle(fontWeight: FontWeight.bold)),
                    ] 
                  )               
                )
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  readOnly: true,
                  style: TextStyle(color: globals.grySecundario),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: globals.grySecundario, width: 0.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: globals.grySecundario, width: 2.0),
                    ),  
                    contentPadding: EdgeInsets.only(top: 22), // add padding to adjust text
                    hintText: "Usuario",
                    hintStyle: TextStyle(color: globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 17),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(top: 15), // add padding to adjust icon
                      child: Icon(Icons.account_circle_outlined, size: 20.0, color: globals.grySecundario,),
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
                      TextSpan(text: 'O', style: TextStyle(color: globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 25)),
                      TextSpan(text: 'pinión', style: TextStyle(fontWeight: FontWeight.bold)),
                    ] 
                  )               
                )
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  cursorColor: globals.grySecundario,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: globals.grySecundario, width: 0.5),
                    ),
                    focusedBorder: UnderlineInputBorder(                  
                      borderSide: BorderSide(color: globals.grySecundario, width: 2.0),
                    ), 
                    labelText: 'Escribe Aquí',
                    labelStyle: TextStyle(color: globals.grySecundario, fontSize: 18, fontWeight: FontWeight.bold),
                    fillColor: Colors.red,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: globals.grySecundario)
                    ),
                  ),
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
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
                      TextSpan(text: 'P', style: TextStyle(color: globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 25)),
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
                  unratedColor: globals.grySecundario.withOpacity(0.3),
                  itemCount: 5,
                  itemSize: 40.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: globals.grySecundario,
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
                color: globals.grySecundario,
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
                      TextSpan(text: '¡M', style: TextStyle(color: globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 50)),
                      TextSpan(text: 'uchas ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                      TextSpan(text: 'G', style: TextStyle(color: globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 50)),
                      TextSpan(text: 'racias', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                      TextSpan(text: '!', style: TextStyle(color: globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 50)),
                    ] 
                  )               
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}