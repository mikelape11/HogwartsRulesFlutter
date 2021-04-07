import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Ajustes2/Ajustes2.dart';


class InfoLibros extends StatefulWidget {
   final int numLibro;

  InfoLibros(this.numLibro);
  @override
  _InfoLibrosState createState() => _InfoLibrosState();
}

class _InfoLibrosState extends State<InfoLibros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "", //change your color here
        ),
        title: Text('Información', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  ""),),
        backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal :  "",
        centerTitle: true,
        actions: [        
          IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(Icons.settings_outlined, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "", size: 25,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Ajustes2(),
              ));
            }
          ),
        ],
        bottom: PreferredSize(
        child: Container(
          color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "",
          height: 2.0,
        ),
        
        preferredSize: Size.fromHeight(4.0)),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              // color: Colors.black87,
              image: DecorationImage(
                image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoHuf}') :  AssetImage('${globals.fondoGry}'),
                fit: BoxFit.fitWidth,  
              ),
            ),
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            width: 450,
            height: 680,
          ),
          Column(
            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // color: Colors.black87,
                        image: DecorationImage(
                          image:  AssetImage('images/Libros/${widget.numLibro}.jpg'),
                          fit: BoxFit.fitWidth,  
                        ),
                      ),
                      width: 120,
                      height: 200,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [                      
                        Container(
                          child: Text("Titulo ", style: TextStyle(fontFamily: 'BluuNext', color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "", fontSize: 24),)
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/2.2,
                          child: Text(widget.numLibro == 1 ? "Harry Potter y la piedra filosofal" : widget.numLibro == 2 ? "Harry Potter y la camara de los secretos" : widget.numLibro == 3 ? "Harry Potter y el prisionero de Azkaban" : widget.numLibro == 4 ? "Harry Potter y el caliz de fuego" : widget.numLibro == 5 ? "Harry Potter y la Orden del Fenix" : widget.numLibro == 6 ? "Harry Potter y el misterio del principe" : widget.numLibro == 7 ? "Harry Potter y las Reliquias de la muerte" : "", style: TextStyle(color: Colors.white, fontSize: 13))
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Text("Genero ", style: TextStyle(fontFamily: 'BluuNext', color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "", fontSize: 24),)
                        ),
                        Container(
                          child: Text("Fantasia / Aventuras", style: TextStyle(color: Colors.white, fontSize: 12))
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Text("Páginas ", style: TextStyle(fontFamily: 'BluuNext', color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "", fontSize: 24),)
                        ),
                        Container(
                          child: Text(widget.numLibro == 1 ? "285" : widget.numLibro == 2 ? "313" : widget.numLibro == 3 ? "367" : widget.numLibro == 4 ? "665" : widget.numLibro == 5 ? "923" : widget.numLibro == 6 ? "572" : widget.numLibro == 7 ? "699" : "", style: TextStyle(color: Colors.white, fontSize: 12))
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Text("Año ", style: TextStyle(fontFamily: 'BluuNext', color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "", fontSize: 24),)
                        ),
                        Container(
                          child: Text(widget.numLibro == 1 ? "1997" : widget.numLibro == 2 ? "1998" : widget.numLibro == 3 ? "1999" : widget.numLibro == 4 ? "2000" : widget.numLibro == 5 ? "2003" : widget.numLibro == 6 ? "2005" : widget.numLibro == 7 ? "2007" : "", style: TextStyle(color: Colors.white, fontSize: 12))
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 15,
                color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "",
                thickness: 1,
                indent: 20,
                endIndent: 20,         
              ),
              Container(
                height: 380,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: DraggableScrollableSheet(
                  initialChildSize: 1,
                  builder: (context, scrollControler){
                    return SingleChildScrollView(
                      child: Text(
                         widget.numLibro == 1 ? globals.libro1 : widget.numLibro == 2 ? globals.libro2 : widget.numLibro == 3 ? globals.libro3 : widget.numLibro == 4 ? globals.libro4 : widget.numLibro == 5 ? globals.libro5 : widget.numLibro == 6 ? globals.libro6 : widget.numLibro == 7 ? globals.libro7 : "",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    );
                  }
                ),
                
              ),
            ],
          ),
        ],
      ),
    );
  }
}