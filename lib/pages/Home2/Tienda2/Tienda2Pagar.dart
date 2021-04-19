import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Home/Home.dart';

import '../../Ajustes2/Ajustes2.dart';

class Tienda2Pagar extends StatefulWidget {
  const Tienda2Pagar({Key key}) : super(key: key);

  @override
  _Tienda2PagarState createState() => _Tienda2PagarState();
}

class _Tienda2PagarState extends State<Tienda2Pagar> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(globals.color2)
        ),
        title: Text('Favoritos', style: TextStyle(color: Color(globals.color2)),),
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
              image: DecorationImage(
                image:  AssetImage('${globals.fondoNegro3}'),
                fit: BoxFit.fitWidth,  
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  CreditCardWidget(
                    cardBgColor: Color(globals.color1),
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CreditCardForm(
                            numberValidationMessage: "Por favor introduzca un numero valido",
                            cvvValidationMessage: "Por favor introduzca un CVV valido",
                            dateValidationMessage: "Por favor introduzca una fecha valida",
                            textColor: Color(globals.color2),                      
                            formKey: formKey,
                            onCreditCardModelChange: onCreditCardModelChange,
                            obscureCvv: true,
                            obscureNumber: true,
                            cardNumberDecoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(globals.color2), width: 0.5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(globals.color2), width: 2.0),
                              ),
                              labelText: 'Numero de Tarjeta',
                              labelStyle: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold),
                              hintText: 'XXXX XXXX XXXX XXXX',
                              hintStyle: TextStyle(color: Color(globals.color2)),
                            ),
                            expiryDateDecoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(globals.color2), width: 0.5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(globals.color2), width: 2.0),
                              ),
                              labelText: 'Valida Hasta',
                              labelStyle: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold),
                              hintText: 'XX/XX',
                              hintStyle: TextStyle(color: Color(globals.color2)),
                            ),
                            cvvCodeDecoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(globals.color2), width: 0.5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(globals.color2), width: 2.0),
                              ),
                              labelText: 'CVV',
                              labelStyle: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold),
                              hintText: 'XXX',
                              hintStyle: TextStyle(color: Color(globals.color2)),
                            ),
                            cardHolderDecoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(globals.color2), width: 0.5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(globals.color2), width: 2.0),
                              ),
                              labelText: 'Nombre',
                              labelStyle: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              style: TextStyle(color: Color(globals.color2)),
                              decoration: InputDecoration(                         
                                border: OutlineInputBorder(),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(globals.color2), width: 0.5),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(globals.color2), width: 2.0),
                                ),                           
                                labelText: 'Dirección',
                                labelStyle: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold),
                              ),
                            ),                       
                          ),
                          SizedBox(height: 40,),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child: const Text(
                                'Comprar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            color: Color(globals.color4),
                            onPressed: () {
                              if (formKey.currentState.validate()) {

                              } else {

                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )              
          ),
        ],        
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}