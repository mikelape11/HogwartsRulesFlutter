import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Ajustes2/Ajustes2.dart';

class InfoPeliculas extends StatefulWidget {
     final int numPelicula;

  InfoPeliculas(this.numPelicula);

  @override
  _InfoPeliculasState createState() => _InfoPeliculasState();
}

class _InfoPeliculasState extends State<InfoPeliculas> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "", //change your color here
        ),
        title: Text('Información', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "", ),),
        backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal :  "",
        centerTitle: true,
        actions: [        
          IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(Icons.settings_outlined, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "",size: 25,),
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
                          image:  AssetImage('images/Peliculas/${widget.numPelicula}.jpg'),
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
                          child: Text("Titulo ", style: TextStyle(fontFamily: 'BluuNext', color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "",fontSize: 24, ),)
                        ),
                        Container(
                          child: Text(widget.numPelicula == 1 ? "Harry Potter y la piedra filosofal" : widget.numPelicula == 2 ? "Harry Potter y la camara de los secretos" : widget.numPelicula == 3 ? "Harry Potter y el prisionero de Azkaban" : widget.numPelicula == 4 ? "Harry Potter y el caliz de fuego" : widget.numPelicula == 5 ? "Harry Potter y la Orden del Fenix" : widget.numPelicula == 6 ? "Harry Potter y el misterio del principe" : widget.numPelicula == 7 ? "Harry Potter y las Reliquias de la muerte Parte 1" : widget.numPelicula == 8 ? "Harry Potter y las Reliquias de la muerte Parte 2" : "", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold))
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Text("Genero ", style: TextStyle(fontFamily: 'BluuNext', color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "", fontSize: 24),)
                        ),
                        Container(
                          child: Text("Fantasia / Aventuras", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Text("Duración ", style: TextStyle(fontFamily: 'BluuNext', color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "", fontSize: 24),)
                        ),
                        Container(
                          child: Text(widget.numPelicula == 1 ? "2h 39m" : widget.numPelicula == 2 ? "2h 54m" : widget.numPelicula == 3 ? "2h 22m" : widget.numPelicula == 4 ? "2h 37m" : widget.numPelicula == 5 ? "2h 22m" : widget.numPelicula == 6 ? "2h 34m" : widget.numPelicula == 7 ? "2h 26m" : widget.numPelicula == 8 ? "2h 10m" : "", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Text("Año ", style: TextStyle(fontFamily: 'BluuNext', color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "", fontSize: 24),)
                        ),
                        Container(
                          child: Text(widget.numPelicula == 1 ? "2001" : widget.numPelicula == 2 ? "2002" : widget.numPelicula == 3 ? "2004" : widget.numPelicula == 4 ? "2005" : widget.numPelicula == 5 ? "2007" : widget.numPelicula == 6 ? "2009" : widget.numPelicula == 7 ? "2010" : widget.numPelicula == 8 ? "2011" : "", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))
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
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 16, color: Colors.white, 
                          ),
                          children: [
                            //TextSpan(text: 'L', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario :  "", fontWeight: FontWeight.bold, fontSize: 25)),
                            TextSpan(text: widget.numPelicula == 1 ? globals.pelicula1 : widget.numPelicula == 2 ? globals.pelicula2 : widget.numPelicula == 3 ? globals.pelicula3 : widget.numPelicula == 4 ? globals.pelicula4 : widget.numPelicula == 5 ? globals.pelicula5 : widget.numPelicula == 6 ? globals.pelicula6 : widget.numPelicula == 7 ? globals.pelicula7 : widget.numPelicula == 8 ? globals.pelicula8 : "",),
                          ] 
                        )               
                      )
                      // child: Text(
                      //   'Lorem ipsum dolor sit amet consectetur adipiscing elit habitant ac posuere, luctus potenti mus felis odio ultrices egestas ultricies orci, cras praesent condimentum tempus in senectus iaculis vehicula laoreet.  ras praesent condimentum tempus in senectus iaculis vehicula laoreet. ras praesent condimentum tempus in senectus iaculis vehicula laoreet. ras praesent condimentum tempus in senectus iaculis vehicula laoreet.Taciti metus habitant natoque aenean torquent elementum nunc, facilisis ultrices senectus habitasse quam nisl malesuada parturient, eleifend aptent vulputate accumsan ligula enim. Hac justo dictumst conubia malesuada quis fusce sapien, sollicitudin orci montes curabitur posuere mauris, dis porta urna fringilla auctor eu. Himenaeos vivamus magnis volutpat aliquam porta risus conubia vulputate, libero hendrerit diam senectus est tristique scelerisque maecenas eget, natoque ullamcorper dictumst luctus sagittis per dignissim. Lacus nisl suscipit ullamcorper accumsan facilisis purus vulputate auctor penatibus, ornare nibh rutrum ad aliquet nunc sed iaculis, varius platea enim non mi nec aenean dictumst. Montes augue morbi curae netus ad magna egestas potenti, parturient platea metus aptent habitasse facilisis pulvinar pharetra, etiam libero consequat sem cubilia magnis luctus.',
                      //   style: TextStyle(color: Colors.white70, fontSize: 16),
                      // ),
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