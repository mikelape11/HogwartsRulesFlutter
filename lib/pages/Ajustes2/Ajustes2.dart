import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Ajustes2/Cuenta2.dart';
import 'package:hogwarts_rules/pages/Ajustes2/Informacion2.dart';
import 'package:hogwarts_rules/pages/Ajustes2/Opinion2.dart';
import 'package:hogwarts_rules/pages/Portada/Portada.dart';
import 'package:hogwarts_rules/pages/Test/TestAPI.dart';
import 'package:hogwarts_rules/widgets/custom_alert_dialog.dart';
import 'package:hogwarts_rules/pages/Home2/Home2.dart';

import 'CuentaAPI.dart';


class Ajustes2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Stack(
              children: <Widget>[
                IconButton( //ICONO PARA IR AL PERFIL DE USUARIO
                  icon: Icon(Icons.arrow_back, color: Color(globals.color2), size: 25,),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Home2(),
                    ));
                  }
                ),
              ],
            )
          ),
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
                  builder: (context) => Informacion2(),
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
                    Icon(Icons.star, color: Color(globals.color2), size: 20,),
                    SizedBox(width: 10),
                    Text('Danos Tu Opinión', style: TextStyle(fontSize: 20, color: Color(globals.color2)),),
                  ],
                ),             
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Opinion2(),
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
                    Icon(Icons.delete_outline, color: Color(globals.color2), size: 20,),
                    SizedBox(width: 10),
                    Text('Desactivar Cuenta', style: TextStyle(fontSize: 20, color: Color(globals.color2)),),
                  ],
                ),             
              ),
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomAlertDialog(
                      titlePadding: EdgeInsets.all(0.0),
                      contentPadding: EdgeInsets.all(0.0),
                      content: Container(
                        decoration: BoxDecoration(
                          color: Color(globals.color1).withOpacity(0.9),
                          border: Border.all(color: Color(globals.color2), width: 3)
                        ),
                        width: 350,
                        height: 200,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 15),
                              Container(
                                child: Icon(Icons.delete_outline, color: Colors.red, size: 40,),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Text("¿Estas seguro?", style: TextStyle(color: Color(globals.color2))),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Text("Si eliminas la cuenta no podrás recuperarla", style: TextStyle(color: Colors.white70)),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(globals.color4), width: 2.0),      
                                    ),
                                    child: RaisedButton(                       
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      color: Color(globals.color1),
                                      child: Text('ELIMINAR', style: TextStyle(color: Colors.red),),
                                      onPressed: () async{
                                        deleteCuenta(globals.usuario);
                                        deleteDatosTest(globals.usuario);
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => Portada(),
                                        ));
                                      }
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(globals.color4), width: 2.0),      
                                    ),
                                    child: RaisedButton(                       
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      color: Color(globals.color1),
                                      child: Text('CANCELAR', style: TextStyle(color: Colors.white),),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                );
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
                    Icon(Icons.logout, color: Color(globals.color2), size: 20,),
                    SizedBox(width: 10),
                    Text('Cerrar Sesión', style: TextStyle(fontSize: 20, color: Color(globals.color2)),),
                  ],
                ),             
              ),
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomAlertDialog(
                      titlePadding: EdgeInsets.all(0.0),
                      contentPadding: EdgeInsets.all(0.0),
                      content: Container(
                        decoration: BoxDecoration(
                          color: Color(globals.color1).withOpacity(0.9),
                          border: Border.all(color: Color(globals.color2), width: 3)
                        ),
                        width: 350,
                        height: 200,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 15),
                              Container(
                                child: Icon(Icons.logout, color: Colors.red, size: 40,),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Text("¿Estas seguro?", style: TextStyle(color: Color(globals.color2))),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Text("Si cierras sesión volverás al login", style: TextStyle(color: Colors.white70)),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(globals.color4), width: 2.0),      
                                    ),
                                    child: RaisedButton(                       
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      color: Color(globals.color1),
                                      child: Text('CERRAR', style: TextStyle(color: Colors.red),),
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => Portada(),
                                        ));
                                      }
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(globals.color4), width: 2.0),      
                                    ),
                                    child: RaisedButton(                       
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      color: Color(globals.color1),
                                      child: Text('CANCELAR', style: TextStyle(color: Colors.white),),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                );
              },
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