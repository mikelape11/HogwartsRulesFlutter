import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/models/ProductosModelo.dart';
import 'package:hogwarts_rules/pages/Ajustes/Ajustes.dart';
import 'package:hogwarts_rules/pages/Home/Home.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;

import 'TiendaAPI.dart';

class TiendaFavoritos extends StatefulWidget {
  @override
  _TiendaFavoritosState createState() => _TiendaFavoritosState();
}

class _TiendaFavoritosState extends State<TiendaFavoritos> {

  bool _isVisible = true;

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
                      builder: (context) => Home(0),
                    ));
                  }
                ),
              ],
            )
          ),
        ),
        iconTheme: IconThemeData(
            color: globals.casaHogwarts == "Gryffindor"
                ? globals.grySecundario
                : globals.casaHogwarts == "Slytherin"
                    ? globals.slySecundario
                    : globals.casaHogwarts == "Ravenclaw"
                        ? globals.ravSecundario
                        : globals.casaHogwarts == "Hufflepuff"
                            ? globals.hufSecundario
                            : globals.grySecundario //change your color here
            ),
        title: Text(
          'Favoritos',
          style: TextStyle(
              color: globals.casaHogwarts == "Gryffindor"
                  ? globals.grySecundario
                  : globals.casaHogwarts == "Slytherin"
                      ? globals.slySecundario
                      : globals.casaHogwarts == "Ravenclaw"
                          ? globals.ravSecundario
                          : globals.casaHogwarts == "Hufflepuff"
                              ? globals.hufSecundario
                              : globals.grySecundario),
        ),
        backgroundColor: globals.casaHogwarts == "Gryffindor"
            ? globals.gryPrincipal
            : globals.casaHogwarts == "Slytherin"
                ? globals.slyPrincipal
                : globals.casaHogwarts == "Ravenclaw"
                    ? globals.ravPrincipal
                    : globals.casaHogwarts == "Hufflepuff"
                        ? globals.hufPrincipal
                        : globals.gryPrincipal,
        centerTitle: true,
        actions: [
          IconButton(
              //ICONO PARA IR AL PERFIL DE USUARIO
              icon: Icon(
                Icons.settings_outlined,
                color: globals.casaHogwarts == "Gryffindor"
                    ? globals.grySecundario
                    : globals.casaHogwarts == "Slytherin"
                        ? globals.slySecundario
                        : globals.casaHogwarts == "Ravenclaw"
                            ? globals.ravSecundario
                            : globals.casaHogwarts == "Hufflepuff"
                                ? globals.hufSecundario
                                : globals.grySecundario,
                size: 25,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Ajustes(),
                ));
              }),
        ],
        bottom: PreferredSize(
            child: Container(
              color: globals.casaHogwarts == "Gryffindor"
                  ? globals.grySecundario
                  : globals.casaHogwarts == "Slytherin"
                      ? globals.slySecundario
                      : globals.casaHogwarts == "Ravenclaw"
                          ? globals.ravSecundario
                          : globals.casaHogwarts == "Hufflepuff"
                              ? globals.hufSecundario
                              : globals.grySecundario,
              height: 2.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: globals.casaHogwarts == "Gryffindor"
                    ? AssetImage('${globals.fondoGry}')
                    : globals.casaHogwarts == "Slytherin"
                        ? AssetImage('${globals.fondoSly}')
                        : globals.casaHogwarts == "Ravenclaw"
                            ? AssetImage('${globals.fondoRav}')
                            : globals.casaHogwarts == "Hufflepuff"
                                ? AssetImage('${globals.fondoHuf}')
                                : AssetImage('${globals.fondoGry}'),
                fit: BoxFit.fitWidth,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: FutureBuilder(
              future: getFavoritos(globals.usuario),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(!snapshot.hasData){    
                return Center(child: CircularProgressIndicator(strokeWidth: 2));
              }
              return Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 1.1,
                child: DraggableScrollableSheet(
                    initialChildSize: 1,
                    builder: (context, scrollControler) {
                      return GridView.count(
                        primary: false,
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: [
                          for (var i = 0; i < snapshot.data.length; i++)
                            for(var k=0; k<snapshot.data[i].productos.length;k++)
                              for(var j=0; j<snapshot.data[i].productos[k].foto.length;j++)
                            Visibility(
                              visible: _isVisible,
                              child: FlipCard(
                                  direction: FlipDirection.HORIZONTAL,
                                  speed: 1000,
                                  front: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: globals.casaHogwarts ==
                                                  "Gryffindor"
                                              ? globals.gryPrincipal
                                              : globals.casaHogwarts == "Slytherin"
                                                  ? globals.slyPrincipal
                                                  : globals.casaHogwarts ==
                                                          "Ravenclaw"
                                                      ? globals.ravPrincipal
                                                      : globals.casaHogwarts ==
                                                              "Hufflepuff"
                                                          ? globals.hufPrincipal
                                                          : globals.gryPrincipal,
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 2.0,
                                                  color: globals.casaHogwarts ==
                                                          "Gryffindor"
                                                      ? globals.grySecundario
                                                      : globals.casaHogwarts ==
                                                              "Slytherin"
                                                          ? globals.slySecundario
                                                          : globals.casaHogwarts ==
                                                                  "Ravenclaw"
                                                              ? globals
                                                                  .ravSecundario
                                                              : globals.casaHogwarts ==
                                                                      "Hufflepuff"
                                                                  ? globals
                                                                      .hufSecundario
                                                                  : globals
                                                                      .grySecundario)),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: MemoryImage(base64Decode(snapshot.data[i].productos[k].foto[j].thumbUrl.split(',').last)),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            //ICONO PARA IR AL PERFIL DE USUARIO
                                            icon: Icon(
                                              Icons.remove_circle_outline,
                                              color: globals.casaHogwarts ==
                                                      "Gryffindor"
                                                  ? globals.grySecundario
                                                  : globals.casaHogwarts ==
                                                          "Slytherin"
                                                      ? globals.slySecundario
                                                      : globals.casaHogwarts ==
                                                              "Ravenclaw"
                                                          ? globals.ravSecundario
                                                          : globals.casaHogwarts ==
                                                                  "Hufflepuff"
                                                              ? globals
                                                                  .hufSecundario
                                                              : globals
                                                                  .grySecundario,
                                              size: 25,
                                            ),
                                            onPressed: () async{
                                              List<ProductosModelo> prods = new List<ProductosModelo>();
                                              prods.add(snapshot.data[i].productos[k]);
                                              await deleteFavoritos(snapshot.data[i].id, prods);
                                              setState(() {
                                                
                                              });
                                            }),
                                      ),
                                    ],
                                  ),
                                  back: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: globals.casaHogwarts == "Gryffindor"
                                          ? globals.gryPrincipal
                                          : globals.casaHogwarts == "Slytherin"
                                              ? globals.slyPrincipal
                                              : globals.casaHogwarts == "Ravenclaw"
                                                  ? globals.ravPrincipal
                                                  : globals.casaHogwarts ==
                                                          "Hufflepuff"
                                                      ? globals.hufPrincipal
                                                      : globals.gryPrincipal,
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 2.0,
                                              color: globals.casaHogwarts ==
                                                      "Gryffindor"
                                                  ? globals.grySecundario
                                                  : globals.casaHogwarts ==
                                                          "Slytherin"
                                                      ? globals.slySecundario
                                                      : globals.casaHogwarts ==
                                                              "Ravenclaw"
                                                          ? globals.ravSecundario
                                                          : globals.casaHogwarts ==
                                                                  "Hufflepuff"
                                                              ? globals
                                                                  .hufSecundario
                                                              : globals
                                                                  .grySecundario)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          child: Text(
                                            "${snapshot.data[i].productos[k].nombre}",
                                            style: TextStyle(color: Colors.white70),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "${snapshot.data[i].productos[k].precio} €",
                                            style: TextStyle(color: Colors.white70),
                                          ),
                                        ),
                                        Container(
                                          child: RaisedButton(
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize.shrinkWrap,
                                              color: Colors.transparent,
                                              child: Text(
                                                'Comprar',
                                                style: TextStyle(
                                                    color: globals.casaHogwarts ==
                                                            "Gryffindor"
                                                        ? globals.grySecundario
                                                        : globals.casaHogwarts ==
                                                                "Slytherin"
                                                            ? globals.slySecundario
                                                            : globals.casaHogwarts ==
                                                                    "Ravenclaw"
                                                                ? globals
                                                                    .ravSecundario
                                                                : globals.casaHogwarts ==
                                                                        "Hufflepuff"
                                                                    ? globals
                                                                        .hufSecundario
                                                                    : globals
                                                                        .grySecundario),
                                              ),
                                              onPressed: () async {
                                                // Navigator.of(context).push(MaterialPageRoute(
                                                //   builder: (context) => DetallesTienda(),
                                                // ));
                                              }),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                        ],
                      );
                    }),
              );
              }
            ),
          )
        ],
      ),
    );
  }
}