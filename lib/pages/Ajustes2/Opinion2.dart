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
          color: Color(globals.color2), //change your color here
        ),
        //automaticallyImplyLeading: false,
        title: Text('Opinion', style: TextStyle(color: Color(globals.color2)),),
        backgroundColor: Color(globals.color1),
        centerTitle: true,
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
                    hintText: "Usuario",
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
                child: TextField(
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
            ],
          ),
        ),
      ),
    );
  }
}