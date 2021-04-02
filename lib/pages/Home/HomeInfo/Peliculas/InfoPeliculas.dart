import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Ajustes2/Ajustes2.dart';

class InfoPeliculas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: globals.grySecundario, //change your color here
        ),
        title: Text('Información', style: TextStyle(color: globals.grySecundario),),
        backgroundColor: globals.gryPrincipal,
        centerTitle: true,
        actions: [        
          IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(Icons.settings_outlined, color: globals.grySecundario, size: 25,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Ajustes2(),
              ));
            }
          ),
        ],
        bottom: PreferredSize(
        child: Container(
          color: globals.grySecundario,
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
                image:  AssetImage('${globals.fondoGry}'),
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
                          image:  AssetImage('images/Peliculas/1.jpg'),
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
                          child: Text("Titulo ", style: TextStyle(fontFamily: 'BluuNext', color: globals.grySecundario, fontSize: 24, ),)
                        ),
                        Container(
                          child: Text("Harry Potter y la piedra filosofal", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold))
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Text("Genero ", style: TextStyle(fontFamily: 'BluuNext', color: globals.grySecundario, fontSize: 24),)
                        ),
                        Container(
                          child: Text("Fantasia / Aventuras", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Text("Duración ", style: TextStyle(fontFamily: 'BluuNext', color: globals.grySecundario, fontSize: 24),)
                        ),
                        Container(
                          child: Text("152 Minutos", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Text("Año ", style: TextStyle(fontFamily: 'BluuNext', color: globals.grySecundario, fontSize: 24),)
                        ),
                        Container(
                          child: Text("2001", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 15,
                color: globals.grySecundario,
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
                            TextSpan(text: 'L', style: TextStyle(color: globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 25)),
                            TextSpan(text: 'orem ipsum dolor sit amet consectetur adipiscing elit habitant ac posuere, luctus potenti mus felis odio ultrices egestas ultricies orci, cras praesent condimentum tempus in senectus iaculis vehicula laoreet.  ras praesent condimentum tempus in senectus iaculis vehicula laoreet. ras praesent condimentum tempus in senectus iaculis vehicula laoreet. ras praesent condimentum tempus in senectus iaculis vehicula laoreet.Taciti metus habitant natoque aenean torquent elementum nunc, facilisis ultrices senectus habitasse quam nisl malesuada parturient, eleifend aptent vulputate accumsan ligula enim. Hac justo dictumst conubia malesuada quis fusce sapien, sollicitudin orci montes curabitur posuere mauris, dis porta urna fringilla auctor eu. Himenaeos vivamus magnis volutpat aliquam porta risus conubia vulputate, libero hendrerit diam senectus est tristique scelerisque maecenas eget, natoque ullamcorper dictumst luctus sagittis per dignissim. Lacus nisl suscipit ullamcorper accumsan facilisis purus vulputate auctor penatibus, ornare nibh rutrum ad aliquet nunc sed iaculis, varius platea enim non mi nec aenean dictumst. Montes augue morbi curae netus ad magna egestas potenti, parturient platea metus aptent habitasse facilisis pulvinar pharetra, etiam libero consequat sem cubilia magnis luctus.',),
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