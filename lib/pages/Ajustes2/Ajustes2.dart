import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Ajustes/Cuenta/CuentaAPI.dart';
import 'package:hogwarts_rules/pages/Ajustes2/Cuenta2/Cuenta2.dart';
import 'package:hogwarts_rules/pages/Ajustes2/Informacion2/Informacion2.dart';
import 'package:hogwarts_rules/pages/Ajustes2/Opinion2/Opinion2.dart';
import 'package:hogwarts_rules/pages/Portada/Portada.dart';
import 'package:hogwarts_rules/pages/Test/TestAPI.dart';
import 'package:hogwarts_rules/widgets/custom_alert_dialog.dart';

class Ajustes2 extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: globals.grySecundario, //change your color here
        ),
        //automaticallyImplyLeading: false,
        title: Text('Ajustes2', style: TextStyle(color: globals.grySecundario),),
        backgroundColor: globals.gryPrincipal,
        centerTitle: true,
        
        bottom: PreferredSize(
        child: Container(
          color: globals.grySecundario,
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(4.0)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          image: DecorationImage(
            image:  AssetImage('images/Gryffindor/gryffindor.png'),
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
                    Icon(Icons.person, color: globals.grySecundario, size: 20,),
                    SizedBox(width: 10),
                    Text('Cuenta', style: TextStyle(fontSize: 20, color: globals.grySecundario),),
                  ],
                ),             
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Cuenta2(),
                ));
              },
            ),
            Divider(
              height: 15,
              color: globals.grySecundario,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            GestureDetector(
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: globals.grySecundario, size: 20,),
                    SizedBox(width: 10),
                    Text('Información', style: TextStyle(fontSize: 20, color: globals.grySecundario),),
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
              color: globals.grySecundario,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  Icon(Icons.text_snippet, color: globals.grySecundario, size: 20,),
                  SizedBox(width: 10),
                  Text('Test', style: TextStyle(fontSize: 20, color: globals.grySecundario),),
                ],
              ),             
            ),
            Divider(
              height: 15,
              color: globals.grySecundario,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  Icon(Icons.person_add, color: globals.grySecundario, size: 20,),
                  SizedBox(width: 10),
                  Text('Contactos', style: TextStyle(fontSize: 20, color: globals.grySecundario),),
                ],
              ),             
            ),
            Divider(
              height: 15,
              color: globals.grySecundario,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  Icon(Icons.person_remove_alt_1_sharp, color: globals.grySecundario, size: 20,),
                  SizedBox(width: 10),
                  Text('Contactos Bloqueados', style: TextStyle(fontSize: 20, color: globals.grySecundario),),
                ],
              ),             
            ),
            Divider(
              height: 15,
              color: globals.grySecundario,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            GestureDetector(
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Icon(Icons.star, color: globals.grySecundario, size: 20,),
                    SizedBox(width: 10),
                    Text('Danos Tu Opinión', style: TextStyle(fontSize: 20, color: globals.grySecundario),),
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
              color: globals.grySecundario,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            GestureDetector(
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Icon(Icons.delete_outline, color: globals.grySecundario, size: 20,),
                    SizedBox(width: 10),
                    Text('Desactivar Cuenta', style: TextStyle(fontSize: 20, color: globals.grySecundario),),
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
                          color: globals.gryPrincipal.withOpacity(0.9),
                          border: Border.all(color: globals.grySecundario, width: 3)
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
                                child: Text("¿Estas seguro?", style: TextStyle(color: globals.grySecundario)),
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
                                      border: Border.all(color: globals.grySecundario.withOpacity(0.6), width: 2.0),      
                                    ),
                                    child: RaisedButton(                       
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      color: globals.gryPrincipal,
                                      child: Text('ELIMINAR', style: TextStyle(color: Colors.red),),
                                      onPressed: () {
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
                                      border: Border.all(color: globals.grySecundario.withOpacity(0.6), width: 2.0),      
                                    ),
                                    child: RaisedButton(                       
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      color: globals.gryPrincipal,
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
              color: globals.grySecundario,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            GestureDetector(
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Icon(Icons.logout, color: globals.grySecundario, size: 20,),
                    SizedBox(width: 10),
                    Text('Cerrar Sesión', style: TextStyle(fontSize: 20, color: globals.grySecundario),),
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
                          color: globals.gryPrincipal.withOpacity(0.9),
                          border: Border.all(color: globals.grySecundario, width: 3)
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
                                child: Text("¿Estas seguro?", style: TextStyle(color: globals.grySecundario)),
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
                                      border: Border.all(color: globals.grySecundario.withOpacity(0.6), width: 2.0),      
                                    ),
                                    child: RaisedButton(                       
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      color: globals.gryPrincipal,
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
                                      border: Border.all(color: globals.grySecundario.withOpacity(0.6), width: 2.0),      
                                    ),
                                    child: RaisedButton(                       
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      color: globals.gryPrincipal,
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
              color: globals.grySecundario,
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