import 'package:flutter/material.dart';
import 'package:hogwarts_rules/pages/Home/Home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:audioplayers/audioplayers.dart';

class Test extends StatefulWidget {
  const Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  PageController _pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black87,
              image: DecorationImage(
                image:  AssetImage('images/fondoNegro.png'),
                fit: BoxFit.fitWidth,  
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          PageView(
            //physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: [
              for(var i=0; i<8; i++)
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 270,
                      child: Center(child: Text("${i}", style: TextStyle(fontSize: 200, color: Colors.white70)))
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur adipiscing elit vivamus ligula per, pulvinar fames consequat curae habitasse lobortis nam turpis sodales, magna nisl id sagittis ullamcorper proin suspendisse erat quis.", 
                          style: TextStyle(color: Colors.white),
                        )
                      )
                    ),
                    SizedBox(height: 10,),
                    if(i%2==0)
                      for(var j=1; j<5; j++)
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width/1.2,
                          child: Center(
                            child: RaisedButton(
                              color: Colors.white38,
                              child: Text("Respuesta${j}"),
                              // shape: RoundedRectangleBorder(
                              //   side: BorderSide(color: Colors.white, width: 2,)
                              // ),
                              onPressed: (){
                                if(i==7){
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ));
                                }else{
                                  _pageController.animateToPage(
                                    i+1,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  ); 
                                }
                              },          
                            )
                          )
                        ),
                      )
                    else
                    GridView.count(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: 1.4,
                      children: [
                        for(var x=0; x<4; x++)
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.all(2),
                            height: 10,
                            width: 50,
                            color: Colors.white70,                           
                          ),
                          onTap: (){
                            if(i==7){
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Home(),
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
                      ],
                    )
                  ]
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
                    count: 8,
                    effect: WormEffect(
                      dotColor: Colors.grey[900],
                      activeDotColor: Colors.white
                    ),
                  )
                ),
              )
            ]
          ), 
          SizedBox(height: 100),
          Container(
            height: 10,
          ),        
        ]
      ),
    );
  }
}