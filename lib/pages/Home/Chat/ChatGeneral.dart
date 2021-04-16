import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/main.dart';
import 'package:hogwarts_rules/pages/Ajustes/Ajustes.dart';
import 'package:stream_chat/stream_chat.dart';
import 'dart:math' as math;

ConseguirCliente() async {
  final client = StreamChatClient(
    'b67pax5b2wdq',
    logLevel: Level.INFO,
  );

  /// Set the current user. In a production scenario, this should be done using
  /// a backend to generate a user token using our server SDK.
  /// Please see the following for more information:
  /// https://getstream.io/chat/docs/ios_user_setup_and_tokens/
  await client.connectUser(
    User(
      id: 'cool-shadow-7',
      extraData: {
        'image':
            'https://getstream.io/random_png/?id=cool-shadow-7&amp;name=Cool+shadow',
      },
    ),
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiY29vbC1zaGFkb3ctNyJ9.gkOlCRb1qgy4joHPaxFwPOdXcGvSPvp6QY0S4mpRkVo',
  );

  /// Creates a channel using the type `messaging` and `godevs`.
  /// Channels are containers for holding messages between different members. To
  /// learn more about channels and some of our predefined types, checkout our
  /// our channel docs: https://getstream.io/chat/docs/initialize_channel/?language=dart
  final channel = client.channel('messaging', id: 'godevs');

  /// `.watch()` is used to create and listen to the channel for updates. If the
  /// channel already exists, it will simply listen for new events.
  await channel.watch();

  return channel;
}

/// Example using Stream's Low Level Dart client.
class ChatGeneral extends StatelessWidget {
  /// To initialize this example, an instance of [client] and [channel] is required.

  /// Instance of [StreamChatClient] we created earlier. This contains information about
  /// our application and connection state.

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
                  backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
                    backgroundImage:
                        AssetImage("images/LOGOS/LogoPeque.png"),
                    // backgroundImage: globals.existeAvatar
                    // ? AssetImage("images/perfil.png")
                    // : FileImage(File(globals.avatar))
                  )
                ),
              ],
            )
          ),
        ),
        title: Text('Chat', style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario),
        ),
        backgroundColor: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
        centerTitle: true,
        actions: [
          IconButton(
            //ICONO PARA IR AL PERFIL DE USUARIO
            icon: Icon(
              Icons.settings_outlined,
              color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
              size: 25,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Ajustes(),
              ));
            }
          ),
        ],
        bottom: PreferredSize(
          child: Container(
            color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(4.0)
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              // color: Colors.black87,
              image: DecorationImage(
                image: globals.casaHogwarts == "Gryffindor" ? AssetImage('${globals.fondoGry}') : globals.casaHogwarts == "Slytherin" ? AssetImage('${globals.fondoSly}') : globals.casaHogwarts == "Ravenclaw" ? AssetImage('${globals.fondoRav}') : globals.casaHogwarts == "Hufflepuff" ? AssetImage('${globals.fondoHuf}') : AssetImage('${globals.fondoGry}'),
                fit: BoxFit.fitWidth,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // width: 450,
            // height: 620,
          ),
          FutureBuilder<dynamic>(
            future: ConseguirCliente(), // async work
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return HomeScreen(channel: snapshot.data as Channel);
              } else
                return CircularProgressIndicator();
            }
          )
        ],
      ),
    );
  }
}

/// Main screen of our application. The layout is comprised of an [AppBar]
/// containing the channel name and a [MessageView] displaying recent messages.
class HomeScreen extends StatelessWidget {
  /// [HomeScreen] is constructed using the [Channel] we defined earlier.
  const HomeScreen({Key key, @required this.channel}) : super(key: key);

  /// Channel object containing the [Channel.id] we'd like to observe.
  final Channel channel;

  @override
  Widget build(BuildContext context) {
    final messages = channel.state.channelStateStream;
    return SafeArea(
      child: StreamBuilder<ChannelState>(
        stream: messages,
        builder: (BuildContext context, AsyncSnapshot<ChannelState> snapshot,) {
          if (snapshot.hasData && snapshot.data != null) {
            return MessageView(
              messages: snapshot.data.messages.reversed.toList(),
              channel: channel,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'There was an error loading messages. Please see logs.',
              ),
            );
          }
          return const Center(
            child: SizedBox(
              width: 100.0,
              height: 100.0,
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

class MessageView extends StatefulWidget {
  /// Message takes the latest list of messages and the current channel.
  const MessageView({
    Key key,
    @required this.messages,
    @required this.channel,
  }) : super(key: key);

  /// List of messages sent in the given channel.
  final List<Message> messages;

  /// Current channel being observed.
  final Channel channel;

  @override
  _MessageViewState createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  TextEditingController _controller;
  ScrollController _scrollController;

  List<Message> get _messages => widget.messages;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  /// Convenience method for scrolling the list view when a new message is sent.
  void _updateList() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _messages.length,
            reverse: true,
            itemBuilder: (BuildContext context, int index) {
              final item = _messages[index];
              if (item.user.id == widget.channel.client.uid) {
                //MIS MENSAJES ---------------------------------------------------------
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  alignment: Alignment.centerRight,
                  child: Container(
                    color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(item.text, style: TextStyle(color: Colors.white, fontSize: 17))),
                );
              } else {
                //LOS MENSAJES DE LOS DEMAS ---------------------------------------------------------
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                      Text(item.text, style: TextStyle(color: Colors.white)
                    ),
                  ),
                );
              }
            },
          ),
        ),
        SizedBox(height: 5,),
        Container(
          color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontSize: 18),
                  controller: _controller,
                  decoration: InputDecoration(
                    filled: true,
                    //fillColor: Colors.white,
                    hintText: 'Mensaje',
                    hintStyle: TextStyle(color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario, fontWeight: FontWeight.bold, fontSize: 18),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Transform.rotate(
                    angle: -45 * math.pi / 180,
                    child: Icon(
                      Icons.attach_file,
                      color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
                      size: 32,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Material(                     
                type: MaterialType.circle,
                color: globals.casaHogwarts == "Gryffindor" ? globals.grySecundario : globals.casaHogwarts == "Slytherin" ? globals.slySecundario : globals.casaHogwarts == "Ravenclaw" ? globals.ravSecundario : globals.casaHogwarts == "Hufflepuff" ? globals.hufSecundario : globals.grySecundario,
                clipBehavior: Clip.hardEdge,
                child: InkWell(              
                  child: Container(                
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Icon(        
                        Icons.send,
                        color: globals.casaHogwarts == "Gryffindor" ? globals.gryPrincipal : globals.casaHogwarts == "Slytherin" ? globals.slyPrincipal : globals.casaHogwarts == "Ravenclaw" ? globals.ravPrincipal : globals.casaHogwarts == "Hufflepuff" ? globals.hufPrincipal : globals.gryPrincipal,
                      ),
                    ),
                  ),
                  onTap: () async {
                    // We can send a new message by calling `sendMessage` on
                    // the current channel. After sending a message, the
                    // TextField is cleared and the list view is scrolled
                    // to show the new item.
                    if (_controller.value.text.isNotEmpty) {
                      await widget.channel.sendMessage(
                        Message(text: _controller.value.text),
                      );
                      _controller.clear();
                      _updateList();
                    }
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

/// Helper extension for quickly retrieving the current user id from a [StreamChatClient].
extension on StreamChatClient {
  String get uid => state.user.id;
}