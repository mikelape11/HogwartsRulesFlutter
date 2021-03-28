import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Ajustes/Ajustes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Cuenta extends StatefulWidget {

  @override
  _CuentaState createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {

  String avatar = "images/Avatares/Avatar1.png";
  int i;

  void cambiarAvatar(i){
    setState(() {
      avatar = "images/Avatares/Avatar${i}.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    PageController _pageController = new PageController();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(globals.color2), //change your color here
        ),
        //automaticallyImplyLeading: false,
        title: Text('Cuenta', style: TextStyle(color: Color(globals.color2)),),
        backgroundColor: Color(globals.color1),
        centerTitle: true,
        actions: [        
          IconButton(
            icon: Icon(Icons.done_outline_rounded, color: Color(globals.color2), size: 25,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Ajustes(),
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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          image: DecorationImage(
            image:  AssetImage('images/fondoNegro3.png'),
            fit: BoxFit.fitWidth,  
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                style: TextStyle(color: Color(globals.color2)),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(globals.color2), width: 0.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(globals.color2), width: 2.0),
                  ),  
                  contentPadding: EdgeInsets.only(top: 22), // add padding to adjust text
                  hintText: "Email",
                  hintStyle: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 17),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(top: 15), // add padding to adjust icon
                    child: Icon(Icons.account_circle_outlined, size: 20.0, color: Color(globals.color2),),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                style: TextStyle(color: Color(globals.color2)),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(globals.color2), width: 0.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(globals.color2), width: 2.0),
                  ),  
                  contentPadding: EdgeInsets.only(top: 22), // add padding to adjust text
                  hintText: "Password",
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
                    TextSpan(text: 'A', style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 25)),
                    TextSpan(text: 'vatar', style: TextStyle(fontWeight: FontWeight.bold)),
                  ] 
                )               
              )
            ),
            Container(
              height: 210,
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 85.0, 
                      backgroundColor: Color(globals.color2),            
                      child: CircleAvatar(
                        radius: 80.0,
                        backgroundColor: Color(globals.color1),
                        backgroundImage: AssetImage(avatar),   
                        // backgroundImage: globals.existeAvatar
                        // ? AssetImage("images/perfil.png") 
                        // : FileImage(File(globals.avatar))
                      )            
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 19, color: Colors.white
                  ),
                  children: [
                    WidgetSpan(
                      child: Container(
                        padding: EdgeInsets.only(right: 50),
                        child: Icon(Icons.arrow_back, size: 25, color: Color(globals.color2),)
                      ),
                    ),
                    TextSpan(text: 'E', style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 25)),
                    TextSpan(text: 'lige tu Avatar', style: TextStyle(fontWeight: FontWeight.bold)),
                    WidgetSpan(
                      child: Container(
                        padding: EdgeInsets.only(left: 50),
                        child: Icon(Icons.arrow_forward, size: 25, color: Color(globals.color2),)
                      ),
                    ),
                  ] 
                )               
              )
            ),
            SizedBox(height: 15),
            Container(
              child: CarouselSlider(
                height: 100.0,
                viewportFraction: 0.33,
                items: [
                  for(var i=1; i<8; i++)        
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage('images/Avatares/Avatar${i}.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      onTap: (){
                        cambiarAvatar(i); 
                      },
                    ),
                ],
              ),
            ),
            Container(
                //margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.1),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 8,
                    effect: WormEffect(
                      dotColor: Colors.grey[900],
                      activeDotColor: Colors.white
                    ),
                  )
                ),
              )
          ],
        ),
      ),
    );
  }
}