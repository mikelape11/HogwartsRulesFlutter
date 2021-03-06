import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/models/ProductosModelo.dart';
import 'package:hogwarts_rules/pages/Home/Tienda/TiendaAPI.dart';
import 'Tienda2Detalles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hogwarts_rules/models/ImagenRespuestasModelo.dart';


class Tienda2 extends StatefulWidget {
  const Tienda2({Key key}) : super(key: key);

  @override
  _Tienda2State createState() => _Tienda2State();
}

var listaId= [];
var eleccionId;
var eleccionNombre;
var eleccionPrecio;
var eleccionFoto;

List<ProductosModelo>listaProductos = [];

class _Tienda2State extends State<Tienda2> {
    @override
  void initState() { 
    super.initState();
    listaProductos = [];
    devolverDatos();
  }

  Future<List<ProductosModelo>> devolverDatos() async{
    var data = await http.get('http://10.0.2.2:8080/todosProductos');
      var jsonData = json.decode(utf8.decode(data.bodyBytes));

      for (var e in jsonData) {
        ProductosModelo producto = new ProductosModelo();
        producto.id = e["_id"];
        producto.nombre = e["nombre"];
        producto.cantidad = e["cantidad"];
        producto.precio = e["precio"];
        producto.casa = e["casa"];
        producto.descripcion = e["descripcion"];
        producto.tipo = e["tipo"];
        var list = e['foto'] as List;
        producto.foto =  list.map((i) => imagenRespuestasModelo.fromJson(i)).toList();

        setState(() {
          listaProductos.add(producto);

        });
      }
      //return listaProductos;
  }
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
            FutureBuilder(
              future: getProductos(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(!snapshot.hasData){    
                    return Center(child: Text(""));
                }else{ 
                  for(int i=0; i<snapshot.data.length; i++){
                    listaId.add(snapshot.data[i].id);
                  }
                  eleccionId = randomChoice(listaId);
                  for(int i=0; i<snapshot.data.length; i++){
                    if(eleccionId == snapshot.data[i].id){
                      eleccionNombre = snapshot.data[i].nombre;
                      eleccionPrecio= snapshot.data[i].precio;
                      for(int k=0; k<snapshot.data[i].foto.length; k++){
                        eleccionFoto = snapshot.data[i].foto[k].thumbUrl.split(',').last;
                      }
                    }
                   
                  }
                }
                return Container(
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
                              child: Center(child: Text("$eleccionNombre", style: TextStyle(color: Colors.white70, fontSize: 25), textAlign: TextAlign.center,)),
                            ),
                            SizedBox(height: 25,),
                            Container(
                              width: MediaQuery.of(context).size.width/2.5,
                              child: Center(child: Text("$eleccionPrecio ???", style: TextStyle(color: Colors.white70, fontSize: 30),)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: MemoryImage(base64Decode(eleccionFoto)),
                            fit: BoxFit.fitWidth,  
                          ),
                        ),
                        width: 150,
                        height: 150,
                      ),
                    ],
                  )
                );
                }
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
                    FutureBuilder(
                      future: getProductos(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return Container(
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
                          onPressed: (){
                            listaProductos = [];
                            for(int i=0; i<snapshot.data.length; i++){
                                ProductosModelo nuevo = new ProductosModelo();
                                nuevo.id = snapshot.data[i].id;
                                nuevo.nombre = snapshot.data[i].nombre;
                                nuevo.cantidad = snapshot.data[i].cantidad;
                                nuevo.precio = snapshot.data[i].precio;
                                nuevo.casa = snapshot.data[i].casa;
                                nuevo.tipo = snapshot.data[i].tipo;
                                nuevo.descripcion = snapshot.data[i].descripcion;
                                nuevo.foto = snapshot.data[i].foto;
                                setState(() {
                                    listaProductos.add(nuevo);
                                });
                            }
                          },
                        ),
                      );
                      }
                    ),
                    SizedBox(height: 10,),
                    FutureBuilder(
                      future: getProductosCasa("Gryffindor"),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return Container(
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
                          onPressed: (){
                             listaProductos = [];
                              for(int i=0; i<snapshot.data.length; i++){
                                  ProductosModelo nuevo = new ProductosModelo();
                                  nuevo.id = snapshot.data[i].id;
                                  nuevo.nombre = snapshot.data[i].nombre;
                                  nuevo.cantidad = snapshot.data[i].cantidad;
                                  nuevo.precio = snapshot.data[i].precio;
                                  nuevo.casa = snapshot.data[i].casa;
                                  nuevo.tipo = snapshot.data[i].tipo;
                                  nuevo.descripcion = snapshot.data[i].descripcion;
                                  nuevo.foto = snapshot.data[i].foto;
                                  setState(() {
                                     listaProductos.add(nuevo);
                                  });
                              }
                          },
                        ),
                      );
                      }
                    ),
                    SizedBox(height: 10,),
                    FutureBuilder(
                      future: getProductosCasa("Slytherin"),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return Container(
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
                          onPressed: (){
                            listaProductos = [];
                              for(int i=0; i<snapshot.data.length; i++){
                                  ProductosModelo nuevo = new ProductosModelo();
                                  nuevo.id = snapshot.data[i].id;
                                  nuevo.nombre = snapshot.data[i].nombre;
                                  nuevo.cantidad = snapshot.data[i].cantidad;
                                  nuevo.precio = snapshot.data[i].precio;
                                  nuevo.casa = snapshot.data[i].casa;
                                  nuevo.tipo = snapshot.data[i].tipo;
                                  nuevo.descripcion = snapshot.data[i].descripcion;
                                  nuevo.foto = snapshot.data[i].foto;
                                  setState(() {
                                     listaProductos.add(nuevo);
                                  });
                              }
                          },
                        ),
                      );
                      }
                    ),
                    SizedBox(height: 10,),
                    FutureBuilder(
                      future: getProductosCasa("Ravenclaw"),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return Container(
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
                          onPressed: (){
                            listaProductos = [];
                              for(int i=0; i<snapshot.data.length; i++){
                                  ProductosModelo nuevo = new ProductosModelo();
                                  nuevo.id = snapshot.data[i].id;
                                  nuevo.nombre = snapshot.data[i].nombre;
                                  nuevo.cantidad = snapshot.data[i].cantidad;
                                  nuevo.precio = snapshot.data[i].precio;
                                  nuevo.casa = snapshot.data[i].casa;
                                  nuevo.tipo = snapshot.data[i].tipo;
                                  nuevo.descripcion = snapshot.data[i].descripcion;
                                  nuevo.foto = snapshot.data[i].foto;
                                  setState(() {
                                     listaProductos.add(nuevo);
                                  });
                              }
                          },
                        ),
                      );
                      }
                    ),
                    SizedBox(height: 10,),
                    FutureBuilder(
                      future: getProductosCasa("Hufflepuff"),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return Container(
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
                          onPressed: (){
                            listaProductos = [];
                              for(int i=0; i<snapshot.data.length; i++){
                                  ProductosModelo nuevo = new ProductosModelo();
                                  nuevo.id = snapshot.data[i].id;
                                  nuevo.nombre = snapshot.data[i].nombre;
                                  nuevo.cantidad = snapshot.data[i].cantidad;
                                  nuevo.precio = snapshot.data[i].precio;
                                  nuevo.casa = snapshot.data[i].casa;
                                  nuevo.tipo = snapshot.data[i].tipo;
                                  nuevo.descripcion = snapshot.data[i].descripcion;
                                  nuevo.foto = snapshot.data[i].foto;
                                  setState(() {
                                     listaProductos.add(nuevo);
                                  });
                              }
                          },
                        ),
                      );
                      }
                    ),
                    SizedBox(height: 10,),
                    FutureBuilder(
                      future: getProductosTipo("Ropa"),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return Container(
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
                          onPressed: (){
                            listaProductos = [];
                              for(int i=0; i<snapshot.data.length; i++){
                                  ProductosModelo nuevo = new ProductosModelo();
                                  nuevo.id = snapshot.data[i].id;
                                  nuevo.nombre = snapshot.data[i].nombre;
                                  nuevo.cantidad = snapshot.data[i].cantidad;
                                  nuevo.precio = snapshot.data[i].precio;
                                  nuevo.casa = snapshot.data[i].casa;
                                  nuevo.tipo = snapshot.data[i].tipo;
                                  nuevo.descripcion = snapshot.data[i].descripcion;
                                  nuevo.foto = snapshot.data[i].foto;
                                  setState(() {
                                     listaProductos.add(nuevo);
                                  });
                              }
                          },
                        ),
                      );
                      }
                    ),
                    SizedBox(height: 10,),
                    FutureBuilder(
                      future: getProductosTipo("Objeto"),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return Container(
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
                          onPressed: (){
                            listaProductos = [];
                              for(int i=0; i<snapshot.data.length; i++){
                                  ProductosModelo nuevo = new ProductosModelo();
                                  nuevo.id = snapshot.data[i].id;
                                  nuevo.nombre = snapshot.data[i].nombre;
                                  nuevo.cantidad = snapshot.data[i].cantidad;
                                  nuevo.precio = snapshot.data[i].precio;
                                  nuevo.casa = snapshot.data[i].casa;
                                  nuevo.tipo = snapshot.data[i].tipo;
                                  nuevo.descripcion = snapshot.data[i].descripcion;
                                  nuevo.foto = snapshot.data[i].foto;
                                  setState(() {
                                     listaProductos.add(nuevo);
                                  });
                              }
                          },
                        ),
                      );
                      }
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
                        for(int n=0; n<listaProductos.length;n++)   
                          for(int k=0; k<listaProductos[n].foto.length;k++)                    
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
                                  image: MemoryImage(base64Decode(listaProductos[n].foto[k].thumbUrl.split(',').last)),
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
                                  child: Text("${listaProductos[n].nombre}", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: Text("${listaProductos[n].precio} ???", style: TextStyle(color: Colors.white70),),
                                ),
                                Container(
                                  child: RaisedButton(                       
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    color: Color(globals.color4),
                                    child: Text('Comprar', style: TextStyle(color: Color(globals.color2)),),
                                    onPressed: () async{
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Tienda2Detalles(listaProductos[n].id, listaProductos[n].nombre, listaProductos[n].precio, listaProductos[n].cantidad, listaProductos[n].casa, listaProductos[n].tipo, listaProductos[n].descripcion, listaProductos[n].foto, listaProductos[n].foto[k].thumbUrl.split(',').last),
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