import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Ajustes2/Ajustes2.dart';
import 'package:hogwarts_rules/pages/Home2/Informacion2/Home2Portada.dart';
import 'package:hogwarts_rules/pages/Home2/Tienda2/Tienda2.dart';

import 'Home2SobreNosotros.dart';

class Home2SobreNosotrosGeneral extends StatelessWidget {
  const Home2SobreNosotrosGeneral({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 22.0, 
                  backgroundColor: Color(globals.color2),            
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Color(globals.color1),
                    backgroundImage: globals.avatarElegido == "" ?  AssetImage(globals.avatarDefecto) : AssetImage(globals.avatarElegido),
                    // backgroundImage: globals.existeAvatar
                    // ? AssetImage("images/perfil.png") 
                    // : FileImage(File(globals.avatar))
                  )            
                ),
              ],
            )
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text('Sobre Nosotros', style: TextStyle(color: Color(globals.color2)),),
        backgroundColor: Color(globals.color1),
        centerTitle: true,
        actions: [        
          IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(Icons.settings_outlined, color: Color(globals.color2), size: 25,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Ajustes2(),
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              // color: Colors.black87,
              image: DecorationImage(
                image: AssetImage('${globals.fondoNegro3}'),
                fit: BoxFit.fitWidth,  
              ),
            ),
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            width: 450,
            height: 620,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Home2SobreNosotros()
              ],
            ),   
          ),
        ],   
      ),
      
    );
  }
}