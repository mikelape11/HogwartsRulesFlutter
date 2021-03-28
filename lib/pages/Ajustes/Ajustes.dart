import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Ajustes/Cuenta/Cuenta.dart';
import 'package:hogwarts_rules/pages/Ajustes/Informacion/Informacion.dart';
import 'package:hogwarts_rules/pages/Home2/Home2.dart';


class Ajustes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(globals.color2), //change your color here
        ),
        //automaticallyImplyLeading: false,
        title: Text('Ajustes', style: TextStyle(color: Color(globals.color2)),),
        backgroundColor: Color(globals.color1),
        centerTitle: true,
        
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
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: <Widget>[
            GestureDetector(
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Icon(Icons.person, color: Color(globals.color2), size: 20,),
                    SizedBox(width: 10),
                    Text('Cuenta', style: TextStyle(fontSize: 20, color: Color(globals.color2)),),
                  ],
                ),             
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Cuenta(),
                ));
              },
            ),
            Divider(
              height: 15,
              color: Color(globals.color2),
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            GestureDetector(
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Color(globals.color2), size: 20,),
                    SizedBox(width: 10),
                    Text('Información', style: TextStyle(fontSize: 20, color: Color(globals.color2)),),
                  ],
                ),             
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Informacion(),
                ));
              },
            ),
            Divider(
              height: 15,
              color: Color(globals.color2),
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.grey, size: 20,),
                  SizedBox(width: 10),
                  Text('Test', style: TextStyle(fontSize: 20, color: Colors.grey),),
                ],
              ),             
            ),
            Divider(
              height: 15,
              color: Color(globals.color2),
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  Icon(Icons.person_add, color: Color(globals.color2), size: 20,),
                  SizedBox(width: 10),
                  Text('Contactos', style: TextStyle(fontSize: 20, color: Color(globals.color2)),),
                ],
              ),             
            ),
            Divider(
              height: 15,
              color: Color(globals.color2),
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  Icon(Icons.person_remove_alt_1_sharp, color: Color(globals.color2), size: 20,),
                  SizedBox(width: 10),
                  Text('Contactos Bloqueados', style: TextStyle(fontSize: 20, color: Color(globals.color2)),),
                ],
              ),             
            ),
            Divider(
              height: 15,
              color: Color(globals.color2),
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  Icon(Icons.delete_outline, color: Color(globals.color2), size: 20,),
                  SizedBox(width: 10),
                  Text('Desactivar Cuenta', style: TextStyle(fontSize: 20, color: Color(globals.color2)),),
                ],
              ),             
            ),
            Divider(
              height: 15,
              color: Color(globals.color2),
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  Icon(Icons.close, color: Color(globals.color2), size: 20,),
                  SizedBox(width: 10),
                  Text('Cerrar Sesión', style: TextStyle(fontSize: 20, color: Color(globals.color2)),),
                ],
              ),             
            ),
            Divider(
              height: 15,
              color: Color(globals.color2),
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
          ],
        ),
      ),

      
    );
  }
}