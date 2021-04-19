import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hogwarts_rules/globals/globals.dart' as globals;
import 'package:hogwarts_rules/main.dart';
import 'package:hogwarts_rules/pages/Ajustes/Ajustes.dart';
import 'package:stream_chat/stream_chat.dart';
import 'package:stream_chat_persistence/stream_chat_persistence.dart';
import 'dart:math' as math;

Channel channel = new Channel(null, null, null, null);
ConseguirCliente() async {
  if (!globals.conexion) {
    globals.cliente = StreamChatClient('mnfxmhsn3j5t');
//b67pax5b2wdq
    WidgetsFlutterBinding.ensureInitialized();

    /// Set the chatPersistenceClient for offline support
    globals.cliente.chatPersistenceClient = StreamChatPersistenceClient(
      logLevel: Level.INFO,
      connectionMode: ConnectionMode.background,
    );

    /// Set the current user. In a production scenario, this should be done using
    /// a backend to generate a user token using our server SDK.
    /// Please see the following for more information:
    /// https://getstream.io/chat/docs/ios_user_setup_and_tokens/
    ///
    
    await globals.cliente.connectUser(
      User(
        id: globals.usuario,
        extraData: {
          'image':
              'https://getstream.io/random_png/?id=cool-shadow-7&amp;name=Cool+shadow',
        },
      ),
      globals.cliente.devToken(globals.usuario),
    );

    //await client.connectGuestUser(User(id: 'Enetz'));

    //await client.connectUserWithProvider(User(id: 'Enetz'));
    //
    //await client.connectUser(User(id: 'Enetz'), "z7dychbrkgg9dhvpf28cy66kabr5m5nr5m26t8ptt3ggv6r2nsejxkr6ytqjf2xw");

    /// Creates a channel using the type `messaging` and `godevs`.
    /// Channels are containers for holding messages between different members. To
    /// learn more about channels and some of our predefined types, checkout our
    /// our channel docs: https://getstream.io/chat/docs/initialize_channel/?language=dart
    channel = globals.cliente.channel('messaging', id: globals.casaHogwarts);

    /// `.watch()` is used to create and listen to the channel for updates. If the
    /// channel already exists, it will simply listen for new events.
    await channel.watch();

    globals.conexion = true;
    return channel;
  } else {
    return channel;
  }
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
                      backgroundColor: globals.casaHogwarts == "Gryffindor"
                          ? globals.grySecundario
                          : globals.casaHogwarts == "Slytherin"
                              ? globals.slySecundario
                              : globals.casaHogwarts == "Ravenclaw"
                                  ? globals.ravSecundario
                                  : globals.casaHogwarts == "Hufflepuff"
                                      ? globals.hufSecundario
                                      : globals.grySecundario,
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: globals.casaHogwarts == "Gryffindor"
                            ? globals.gryPrincipal
                            : globals.casaHogwarts == "Slytherin"
                                ? globals.slyPrincipal
                                : globals.casaHogwarts == "Ravenclaw"
                                    ? globals.ravPrincipal
                                    : globals.casaHogwarts == "Hufflepuff"
                                        ? globals.hufPrincipal
                                        : globals.gryPrincipal,
                        backgroundImage:
                            AssetImage("images/LOGOS/LogoPeque.png"),
                        // backgroundImage: globals.existeAvatar
                        // ? AssetImage("images/perfil.png")
                        // : FileImage(File(globals.avatar))
                      )),
                ],
              )),
        ),
        title: Text(
          'Chat',
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
              // color: Colors.black87,
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
            // width: 450,
            // height: 620,
          ),
          FutureBuilder<dynamic>(
              future: ConseguirCliente(), // async work
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  return HomeScreen(channel: snapshot.data as Channel);
                } else
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: globals.casaHogwarts == "Gryffindor"
                          ? globals.grySecundario
                          : globals.casaHogwarts == "Slytherin"
                              ? globals.slySecundario
                              : globals.casaHogwarts == "Ravenclaw"
                                  ? globals.ravSecundario
                                  : globals.casaHogwarts == "Hufflepuff"
                                      ? globals.hufSecundario
                                      : globals.grySecundario,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          globals.casaHogwarts == "Gryffindor"
                              ? globals.gryPrincipal
                              : globals.casaHogwarts == "Slytherin"
                                  ? globals.slyPrincipal
                                  : globals.casaHogwarts == "Ravenclaw"
                                      ? globals.ravPrincipal
                                      : globals.casaHogwarts == "Hufflepuff"
                                          ? globals.hufPrincipal
                                          : globals.gryPrincipal),
                    ),
                  );
              })
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
        builder: (
          BuildContext context,
          AsyncSnapshot<ChannelState> snapshot,
        ) {
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

  DateTime now = new DateTime.now();

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
                return Column(
                  children: [
                    // Container(
                    //   child: Text(item.user.id),
                    // ),
                    Container(
                      child: Text(item.user.id),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      alignment: Alignment.centerRight,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: globals.casaHogwarts == "Gryffindor"
                                ? globals.gryPrincipal
                                : globals.casaHogwarts == "Slytherin"
                                    ? globals.slyPrincipal
                                    : globals.casaHogwarts == "Ravenclaw"
                                        ? globals.ravPrincipal
                                        : globals.casaHogwarts == "Hufflepuff"
                                            ? globals.hufPrincipal
                                            : globals.gryPrincipal,
                          ),
                          margin: EdgeInsets.only(left: 40),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(item.text,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17))),
                      //Text('${now.hour}:${now.minute}')
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      alignment: Alignment.centerRight,
                      child: Container(
                          child: Text(
                        '${now.hour}:${now.minute}',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ],
                );
              } else {
                //LOS MENSAJES DE LOS DEMAS ---------------------------------------------------------
                return Column(
                  children: [
                    Container(
                      child: Text(item.user.id),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      alignment: Alignment.centerLeft,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: globals.casaHogwarts == "Gryffindor"
                                ? globals.gryPrincipal
                                : globals.casaHogwarts == "Slytherin"
                                    ? globals.slyPrincipal
                                    : globals.casaHogwarts == "Ravenclaw"
                                        ? globals.ravPrincipal
                                        : globals.casaHogwarts == "Hufflepuff"
                                            ? globals.hufPrincipal
                                            : globals.gryPrincipal,
                          ),
                          margin: EdgeInsets.only(right: 40),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(item.text,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17))),
                      //Text('${now.hour}:${now.minute}')
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      alignment: Alignment.centerLeft,
                      child: Container(
                          child: Text(
                        '${now.hour}:${now.minute}',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ],
                );
              }
            },
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          color: globals.casaHogwarts == "Gryffindor"
              ? globals.gryPrincipal
              : globals.casaHogwarts == "Slytherin"
                  ? globals.slyPrincipal
                  : globals.casaHogwarts == "Ravenclaw"
                      ? globals.ravPrincipal
                      : globals.casaHogwarts == "Hufflepuff"
                          ? globals.hufPrincipal
                          : globals.gryPrincipal,
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: TextStyle(
                      color: globals.casaHogwarts == "Gryffindor"
                          ? globals.grySecundario
                          : globals.casaHogwarts == "Slytherin"
                              ? globals.slySecundario
                              : globals.casaHogwarts == "Ravenclaw"
                                  ? globals.ravSecundario
                                  : globals.casaHogwarts == "Hufflepuff"
                                      ? globals.hufSecundario
                                      : globals.grySecundario,
                      fontSize: 18),
                  controller: _controller,
                  decoration: InputDecoration(
                    filled: true,
                    //fillColor: Colors.white,
                    hintText: 'Mensaje',
                    hintStyle: TextStyle(
                        color: globals.casaHogwarts == "Gryffindor"
                            ? globals.grySecundario
                            : globals.casaHogwarts == "Slytherin"
                                ? globals.slySecundario
                                : globals.casaHogwarts == "Ravenclaw"
                                    ? globals.ravSecundario
                                    : globals.casaHogwarts == "Hufflepuff"
                                        ? globals.hufSecundario
                                        : globals.grySecundario,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Transform.rotate(
                    angle: -45 * math.pi / 180,
                    child: IconButton(
                      icon: Icon(
                        Icons.attach_file,
                        color: globals.casaHogwarts == "Gryffindor"
                            ? globals.grySecundario
                            : globals.casaHogwarts == "Slytherin"
                                ? globals.slySecundario
                                : globals.casaHogwarts == "Ravenclaw"
                                    ? globals.ravSecundario
                                    : globals.casaHogwarts == "Hufflepuff"
                                        ? globals.hufSecundario
                                        : globals.grySecundario,
                        size: 32,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Material(
                type: MaterialType.circle,
                color: globals.casaHogwarts == "Gryffindor"
                    ? globals.grySecundario
                    : globals.casaHogwarts == "Slytherin"
                        ? globals.slySecundario
                        : globals.casaHogwarts == "Ravenclaw"
                            ? globals.ravSecundario
                            : globals.casaHogwarts == "Hufflepuff"
                                ? globals.hufSecundario
                                : globals.grySecundario,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Icon(
                        Icons.send,
                        color: globals.casaHogwarts == "Gryffindor"
                            ? globals.gryPrincipal
                            : globals.casaHogwarts == "Slytherin"
                                ? globals.slyPrincipal
                                : globals.casaHogwarts == "Ravenclaw"
                                    ? globals.ravPrincipal
                                    : globals.casaHogwarts == "Hufflepuff"
                                        ? globals.hufPrincipal
                                        : globals.gryPrincipal,
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
