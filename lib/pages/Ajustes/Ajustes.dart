import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Ajustes/Cuenta.dart';
import 'package:hogwarts_rules/pages/Ajustes/Informacion.dart';
import 'package:hogwarts_rules/pages/Ajustes/Opinion.dart';
import 'package:hogwarts_rules/pages/Ajustes2/CuentaAPI.dart';
import 'package:hogwarts_rules/pages/Portada/Portada.dart';
import 'package:hogwarts_rules/pages/Test/TestAPI.dart';
import 'package:hogwarts_rules/widgets/custom_alert_dialog.dart';

import '../../models/EleccionCasaModelo.dart';
import '../../models/UsuarioModelo.dart';
import '../Home/Home.dart';
import '../Test/Test.dart';

class Ajustes extends StatefulWidget {
  @override
  _AjustesState createState() => _AjustesState();
}

UsuarioModelo usuario;
EleccionCasaModelo eleccion;
class _AjustesState extends State<Ajustes> {
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
                  icon: Icon(Icons.arrow_back, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 25,),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Home(2),
                    ));
                  }
                ),
              ],
            )
          ),
        ),
        //automaticallyImplyLeading: false,
        title: Text('Ajustes', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
        backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
        centerTitle: true,
        
        bottom: PreferredSize(
        child: Container(
          color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(4.0)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          image: DecorationImage(
            image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoHuf}') :  AssetImage('${globals.fondoGry}'),
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
                    Icon(Icons.person, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20,),
                    SizedBox(width: 10),
                    Text('Cuenta', style: TextStyle(fontSize: 20, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
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
              color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            GestureDetector(
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20,),
                    SizedBox(width: 10),
                    Text('Información', style: TextStyle(fontSize: 20, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
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
              color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            GestureDetector(
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Icon(Icons.text_snippet, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20,),
                    SizedBox(width: 10),
                    Text('Repetir Test', style: TextStyle(fontSize: 20, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
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
                          color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withOpacity(0.9),
                          border: Border.all(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, width: 3)
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
                                child: Text("¿Estas seguro?", style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario)),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Center(child: Text("Tu casa de Hogwarts puede que se cambie", style: TextStyle(color: Colors.white70))),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FutureBuilder(
                                    future: getTest(),
                                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario.withOpacity(0.6), width: 2.0),      
                                      ),
                                      child: RaisedButton(                       
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
                                        child: Text('REPETIR', style: TextStyle(color: Colors.red),),
                                        onPressed: () async{
                                          deleteDatosTest(globals.usuario);
                                          UsuarioModelo nuevo = new UsuarioModelo();
                                          nuevo.usuario = globals.usuario;
                                          nuevo.casaHogwarts = "";
                                          UsuarioModelo usu = await actualiziarCasaHogwarts(nuevo); 
                                          EleccionCasaModelo puntos = await registrarEleccionCasa(globals.usuario, 0, 0,0,0);            
                                          setState(() {
                                            eleccion = puntos;
                                            usuario = usu;
                                          });
                                          Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => Test(snapshot),
                                          ));
                                        }
                                      ),
                                    );
                                    }
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario.withOpacity(0.6), width: 2.0),      
                                    ),
                                    child: RaisedButton(                       
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
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
              color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  Icon(Icons.person_add, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20,),
                  SizedBox(width: 10),
                  Text('Contactos', style: TextStyle(fontSize: 20, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
                ],
              ),             
            ),
            Divider(
              height: 15,
              color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  Icon(Icons.person_remove_alt_1_sharp, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20,),
                  SizedBox(width: 10),
                  Text('Contactos Bloqueados', style: TextStyle(fontSize: 20, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
                ],
              ),             
            ),
            Divider(
              height: 15,
              color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            GestureDetector(
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Icon(Icons.star, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20,),
                    SizedBox(width: 10),
                    Text('Danos Tu Opinión', style: TextStyle(fontSize: 20, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
                  ],
                ),             
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Opinion(),
                ));
              },
            ),
            Divider(
              height: 15,
              color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            GestureDetector(
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Icon(Icons.delete_outline, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20,),
                    SizedBox(width: 10),
                    Text('Desactivar Cuenta', style: TextStyle(fontSize: 20, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
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
                          color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withOpacity(0.9),
                          border: Border.all(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, width: 3)
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
                                child: Text("¿Estas seguro?", style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario)),
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
                                      border: Border.all(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario.withOpacity(0.6), width: 2.0),      
                                    ),
                                    child: RaisedButton(                       
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
                                      child: Text('ELIMINAR', style: TextStyle(color: Colors.red),),
                                      onPressed: () {
                                        if(globals.conexion != false){
                                          globals.conexion = false;
                                          globals.cliente.disconnect();
                                        }
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
                                      border: Border.all(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario.withOpacity(0.6), width: 2.0),      
                                    ),
                                    child: RaisedButton(                       
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
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
              color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            GestureDetector(
              child: Container(
                height: 40,
                child: Row(
                  children: [
                    Icon(Icons.logout, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, size: 20,),
                    SizedBox(width: 10),
                    Text('Cerrar Sesión', style: TextStyle(fontSize: 20, color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),),
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
                          color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal.withOpacity(0.9),
                          border: Border.all(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, width: 3)
                        ),
                        width: 350,
                        height: 200,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 15),
                              Container(
                                child: Icon(Icons.logout, color: Colors.red[900], size: 40,),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Text("¿Estas seguro?", style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario)),
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
                                      border: Border.all(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario.withOpacity(0.6), width: 2.0),      
                                    ),
                                    child: RaisedButton(                       
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
                                      child: Text('CERRAR', style: TextStyle(color: Colors.red[900]),),
                                      onPressed: () {
                                        if(globals.conexion != false){
                                          globals.cliente.disconnect();
                                          globals.conexion = false;
                                        }
                                        Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => Portada(),
                                        ));
                                      }
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario.withOpacity(0.6), width: 2.0),      
                                    ),
                                    child: RaisedButton(                       
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
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
              color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
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