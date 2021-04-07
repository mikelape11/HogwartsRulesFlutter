import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;

import 'package:hogwarts_rules/pages/Ajustes/Ajustes.dart';

import '../../../globals/globals.dart';
import 'Tienda2Detalles.dart';



class Tienda2 extends StatelessWidget {
  const Tienda2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15,),
        Container(
          child: Center(child: Text("Bienvenido a la tienda Hogwarts Rules", style: TextStyle(color: Colors.white70, fontFamily: 'BluuNext', fontSize: 20))),
        ),
        SizedBox(height: 10,),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                // shadowColor: Colors.black,
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Color(globals.color1),
                child: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: ClipPath(
                    clipper: BackgroundClipper(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(globals.color2).withAlpha(150),
                      ),
                      height: 180,
                      
                    ),
                  ),
                  // child: CustomPaint(
                  //   painter: CardPainter(), //DIBUJA LA LINEA
                  //   //child: Center(child: Text('TIENDA', style: TextStyle(color: Colors.white, fontSize: 40,))),
                  // ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 180,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/2.5,
                          child: Center(child: Text("NOMBRE OBJETO", style: TextStyle(color: Colors.white70, fontSize: 25), textAlign: TextAlign.center,)),
                        ),
                        SizedBox(height: 25,),
                        Container(
                          width: MediaQuery.of(context).size.width/2.5,
                          child: Center(child: Text("20 €", style: TextStyle(color: Colors.white70, fontSize: 30),)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:  AssetImage('images/Varitas/varita1.png'),
                        fit: BoxFit.fitWidth,  
                      ),
                    ),
                    width: 150,
                    height: 150,
                  ),
                ],
              )
            ),
          ] 
        ),
        Divider(
          color: Color(globals.color2),
          indent: 20,
          endIndent: 20,
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(                    
                        border: Border(
                          bottom: BorderSide(width: 2, color: Color(globals.color2)),
                        ),
                      ),
                      child: FlatButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                        ),                    
                        color: Color(globals.color1),
                        child: Text("GENERAL", style: TextStyle(color: Colors.white70),),
                        onPressed: (){},
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(                    
                        border: Border(
                          bottom: BorderSide(width: 2, color: Color(globals.color2)),
                        ),
                      ),
                      child: FlatButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                        ),                    
                        color: Color(globals.color1),
                        child: Text("GRY", style: TextStyle(color: Colors.white70),),
                        onPressed: (){},
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(                    
                        border: Border(
                          bottom: BorderSide(width: 2, color: Color(globals.color2)),
                        ),
                      ),
                      child: FlatButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                        ),                    
                        color: Color(globals.color1),
                        child: Text("SLY", style: TextStyle(color: Colors.white70),),
                        onPressed: (){},
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(                    
                        border: Border(
                          bottom: BorderSide(width: 2, color: Color(globals.color2)),
                        ),
                      ),
                      child: FlatButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                        ),                    
                        color: Color(globals.color1),
                        child: Text("RAV", style: TextStyle(color: Colors.white70),),
                        onPressed: (){},
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(                    
                        border: Border(
                          bottom: BorderSide(width: 2, color: Color(globals.color2)),
                        ),
                      ),
                      child: FlatButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                        ),                    
                        color: Color(globals.color1),
                        child: Text("HUF", style: TextStyle(color: Colors.white70),),
                        onPressed: (){},
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(                    
                        border: Border(
                          bottom: BorderSide(width: 2, color: Color(globals.color2)),
                        ),
                      ),
                      child: FlatButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                        ),                    
                        color: Color(globals.color1),
                        child: Text("ROPA", style: TextStyle(color: Colors.white70),),
                        onPressed: (){},
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(                    
                        border: Border(
                          bottom: BorderSide(width: 2, color: Color(globals.color2)),
                        ),
                      ),
                      child: FlatButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                        ),                    
                        color: Color(globals.color1),
                        child: Text("OBJETOS", style: TextStyle(color: Colors.white70),),
                        onPressed: (){},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10,),
              Container(
                width: MediaQuery.of(context).size.width/1.6,
                height: MediaQuery.of(context).size.height/2.34,
                child: DraggableScrollableSheet(
                  initialChildSize: 1,
                  builder: (context, scrollControler){
                    return GridView.count(
                      primary: false,  
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [                       
                        FlipCard(
                          direction: FlipDirection.HORIZONTAL,
                          speed: 1000,
                          front: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),                              
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:  AssetImage('images/Varitas/varita1.png'),
                                  fit: BoxFit.fitWidth,  
                                ),
                              ),
                            ),
                          ), 
                          back: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: Text("30 €", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: RaisedButton(                       
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    color: Colors.transparent,
                                    child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                    onPressed: () async{
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Tienda2Detalles(),
                                      ));
                                    }
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                        FlipCard(
                          direction: FlipDirection.HORIZONTAL,
                          speed: 1000,
                          front: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:  AssetImage('images/Tienda/Jersey.png'),
                                  fit: BoxFit.fitWidth,  
                                ),
                              ),
                            ),
                          ), 
                          back: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: Text("30 €", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: RaisedButton(                       
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    color: Colors.transparent,
                                    child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                    onPressed: () async{
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Tienda2Detalles(),
                                      ));
                                    }
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                        FlipCard(
                          direction: FlipDirection.HORIZONTAL,
                          speed: 1000,
                          front: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:  AssetImage('images/Tienda/Jersey2.png'),
                                  fit: BoxFit.fitWidth,  
                                ),
                              ),
                            ),
                          ), 
                          back: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: Text("30 €", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: RaisedButton(                       
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    color: Colors.transparent,
                                    child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                    onPressed: () async{
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Tienda2Detalles(),
                                      ));
                                    }
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                        FlipCard(
                          direction: FlipDirection.HORIZONTAL,
                          speed: 1000,
                          front: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:  AssetImage('images/Tienda/Funko.png'),
                                  fit: BoxFit.fitWidth,  
                                ),
                              ),
                            ),
                          ), 
                          back: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: Text("30 €", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: RaisedButton(                       
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    color: Colors.transparent,
                                    child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                    onPressed: () async{
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Tienda2Detalles(),
                                      ));
                                    }
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                        FlipCard(
                          direction: FlipDirection.HORIZONTAL,
                          speed: 1000,
                          front: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:  AssetImage('images/Tienda/Bufanda.png'),
                                  fit: BoxFit.fitWidth,  
                                ),
                              ),
                            ),
                          ), 
                          back: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: Text("30 €", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: RaisedButton(                       
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    color: Colors.transparent,
                                    child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                    onPressed: () async{
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Tienda2Detalles(),
                                      ));
                                    }
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                        FlipCard(
                          direction: FlipDirection.HORIZONTAL,
                          speed: 1000,
                          front: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:  AssetImage('images/Tienda/Libro.png'),
                                  fit: BoxFit.fitWidth,  
                                ),
                              ),
                            ),
                          ), 
                          back: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: Text("30 €", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: RaisedButton(                       
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    color: Colors.transparent,
                                    child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                    onPressed: () async{
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Tienda2Detalles(),
                                      ));
                                    }
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                        FlipCard(
                          direction: FlipDirection.HORIZONTAL,
                          speed: 1000,
                          front: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:  AssetImage('images/Tienda/Taza.png'),
                                  fit: BoxFit.fitWidth,  
                                ),
                              ),
                            ),
                          ), 
                          back: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: Text("30 €", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: RaisedButton(                       
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    color: Colors.transparent,
                                    child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                    onPressed: () async{
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Tienda2Detalles(),
                                      ));
                                    }
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                        FlipCard(
                          direction: FlipDirection.HORIZONTAL,
                          speed: 1000,
                          front: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:  AssetImage('images/Tienda/Niki.png'),
                                  fit: BoxFit.fitWidth,  
                                ),
                              ),
                            ),
                          ), 
                          back: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(globals.color1),
                              border: Border(bottom: BorderSide(width: 2.0, color: Color(globals.color2))),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text("VARITA HP", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: Text("30 €", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: RaisedButton(                       
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    color: Colors.transparent,
                                    child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                    onPressed: () async{
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Tienda2Detalles(),
                                      ));
                                    }
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                      ],
                    );
                  }
                ),
              ),
            ],
          )
        ),
      
      ],
    );
  }
}

class CardPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = new Paint()
                    ..color = Color(globals.color2)
                    ..strokeWidth = 2
                    ..strokeCap = StrokeCap.round
                    ..style = PaintingStyle.stroke;

    final path = new Path();
    path.moveTo(size.width*0.25, size.height);
    path.lineTo(size.width*0.75, 0);
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CardPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CardPainter oldDelegate) => false;
}

class BackgroundClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}