import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/pages/Test/PortadaTest.dart';
import 'package:url_launcher/url_launcher.dart';


class Home2SobreNosotros extends StatefulWidget {
  const Home2SobreNosotros({Key key}) : super(key: key);

  @override
  _Home2SobreNosotrosState createState() => _Home2SobreNosotrosState();
}

class _Home2SobreNosotrosState extends State<Home2SobreNosotros> {
  
  //PAGINA WEB
  final url = 'https://flutter.dev';

  //TWITTER
  final twitterMel = "https://twitter.com/melcius16";
  final twitterMik = "https://twitter.com/mikelcius11";
  final twitterEne = "https://twitter.com/Denotze";
  final twitterEnd = "https://twitter.com/EndikaHs13";

  //INSTAGRAM
  final instaMel = "https://www.instagram.com/melaniemigguel/";
  final instaMik = "https://www.instagram.com/mikel_apezetxea/";
  final instaEne = "https://www.instagram.com/enetzrodriguez/";
  final instaEnd = "https://www.instagram.com/endibra90/";

  //GMAIL
  final gmailMel = "";
  final gmailMik = "";
  final gmailEne = "";
  final gmailEnd = "";

  //GITHUB
  final githubMel = "https://github.com/melanie1998";
  final githubMik = "https://github.com/mikelape11";
  final githubEne = "https://github.com/enetz7";
  final githubEnd = "https://github.com/Endibra90";


  void _launchURL() async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  @override
  Widget build(BuildContext context) {
     return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 35),
            Container(
              child: Text(
                '¿Quienes somos?', 
                style: TextStyle(
                  fontSize: 30, color: Color(globals.color2)
                ),
              )
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 17, color: Colors.white
                  ),
                  children: [
                    TextSpan(text: 'S', style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 25)),
                    TextSpan(text: 'omos un grupo de 4 estudiantes que estamos terminando el curso Desarrollo de Apliaciones Multiplataforma, y para finalizar el curso hemos decidico hacer este proyecto sobre Harry Potter'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 15,
              color: Color(globals.color2),
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Text(
                'Nuestras RRSS', 
                style: TextStyle(
                  fontSize: 30, color: Color(globals.color2)
                ),
              )
            ),
            SizedBox(
              height: 15
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                children: [
                  Row(          
                    children: [ 
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/Nosotros/mik.png'),                   
                          )
                        ),
                      ),  
                      Container(
                        width: 55,
                        child: Text("Mikel", style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                      SizedBox(width: 20),                
                      Container(
                        child: Icon(
                          Entypo.twitter,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: Icon(
                          Entypo.instagram,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: Icon(
                          Entypo.google_,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: Icon(
                          Entypo.github,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(          
                    children: [
                       Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/Nosotros/mel.png'),                   
                          )
                        ),
                      ),
                      Container(
                        width: 55,
                        child: Text("Melanie", style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 15)),
                      ),                  
                      SizedBox(width: 20),                 
                      Container(
                        child: Icon(
                          Entypo.twitter,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: Icon(
                          Entypo.instagram,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: Icon(
                          Entypo.google_,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: Icon(
                          Entypo.github,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(          
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/Nosotros/mik.png'),                   
                          )
                        ),
                      ),
                      Container(
                        width: 55,
                        child: Text("Enetz", style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 15)),
                      ),   
                      SizedBox(width: 20), 
                      Container(
                        child: Icon(
                          Entypo.twitter,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: Icon(
                          Entypo.instagram,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: Icon(
                          Entypo.google_,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: Icon(
                          Entypo.github,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(          
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/Nosotros/mel.png'),                   
                          )
                        ),
                      ),
                      Container(
                        width: 55,
                        child: Text("Endika", style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 15)),
                      ),                   
                      SizedBox(width: 20), 
                      Container(
                        child: Icon(
                          Entypo.twitter,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: Icon(
                          Entypo.instagram,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: Icon(
                          Entypo.google_,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: Icon(
                          Entypo.github,
                          size: 22,
                          color: Color(globals.color2),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 15,
              color: Color(globals.color2),
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Text(
                'Para más información', 
                style: TextStyle(
                  fontSize: 30, color: Color(globals.color2)
                ),
              )
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: _launchURL,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 17, color: Colors.white
                    ),
                    children: [
                      TextSpan(text: 'V' , style: TextStyle(color: Color(globals.color2), fontWeight: FontWeight.bold, fontSize: 25)),
                      TextSpan(text: 'isita nuestra web: '),
                      TextSpan(text: 'www.hogwartsrules.com', style: TextStyle(decoration: TextDecoration.underline)),
                    ],
                  ),
                ),
              ),
            ),
          ]
        ),
      )
    );
  }
}