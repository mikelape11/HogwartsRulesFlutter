import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Home/Home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TestVarita extends StatefulWidget {
  @override
  _TestVaritaState createState() => _TestVaritaState();
}

class _TestVaritaState extends State<TestVarita> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> opacidad;

  @override
  void initState() {

    controller = new AnimationController ( vsync: this, duration: Duration(milliseconds: 2000));
    opacidad = new Tween(begin: 0.0, end: 1.0).animate(controller);

    controller.forward();
    super.initState();
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              // color: Colors.black87,
              image: DecorationImage(
                image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoTestGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoTestSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoTestRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoTestHuf}') :  AssetImage('${globals.fondoGry}'),
                fit: BoxFit.fill,  
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // width: 450,
            // height: 620,
          ), 
          PageView(
            //physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: [
            for(var i=0; i<5; i++)
              FadeTransition(
                opacity: opacidad,
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [                            
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Center(child: Text("Pregunta 1", style: TextStyle(color: Colors.white, fontSize: 30),)),
                      ),
                      SizedBox(height: 50,),
                      for(var j=0; j<2; j++)
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: globals.hufSecundario.withOpacity(0.60),
                            border: Border.all(color: globals.hufSecundario, width: 3)
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width/1.2,
                          child: Center(
                            child: Text("Respuesta1", style: TextStyle(color: Colors.white, fontSize: 20),),
                          ),
                        ),
                        onTap: () async{
                          if(i==5){                            
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Home(0),
                            ));
                          }else{
                            _pageController.animateToPage(
                              i+1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            ); 
                          }
                        },
                      ),
                    ]
                  ),
                  
                ),                    
              ),                
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/1.1),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 5,
                    effect: WormEffect(
                      dotColor: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
                      activeDotColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
                    ),
                  )
                ),
              )
            ]
          ),                  
        ],  
      )
    );
  }
}