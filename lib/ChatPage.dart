import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ChatPage extends StatefulWidget {
  final BluetoothDevice server;

  const ChatPage({this.server});

  @override
  _ChatPage createState() => new _ChatPage();
}

class _Message {
  int whom;
  String text;

  _Message(this.whom, this.text);
}

class _ChatPage extends State<ChatPage> {
  static final clientID = 0;
  static final maxMessageLength = 4096 - 3;
  BluetoothConnection connection;

  List<_Message> messages = List<_Message>();
  String messageBuffer = '';

  final TextEditingController textEditingController = new TextEditingController();
  final ScrollController listScrollController = new ScrollController();

  bool isConnecting = true;
  bool get isConnected => connection != null && connection.isConnected;

  bool isDisconnecting = false;

  @override
  void initState() {
    super.initState();

    BluetoothConnection.toAddress(widget.server.address).then((_connection) {
      print('Connected to the device');
      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });

      connection.input.listen(onDataReceived).onDone(() {
        // Example: Detect which side closed the connection
        // There should be `isDisconnecting` flag to show are we are (locally)
        // in middle of disconnecting process, should be set before calling
        // `dispose`, `finish` or `close`, which all causes to disconnect.
        // If we except the disconnection, `onDone` should be fired as result.
        // If we didn't except this (no flag set), it means closing by remote.
        if (isDisconnecting) {
          print('Disconnecting locally!');
        }
        else {
          print('Disconnected remotely!');
        }
        if (this.mounted) {
          setState(() {});
        }
      });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  @override
  void dispose() {
    // Avoid memory leak (`setState` after dispose) and disconnect
    if (isConnected) {
      isDisconnecting = true;
      connection.dispose();
      connection = null;
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Row> list = messages.map((_message) {
      return Row(
        children: <Widget>[
          Container(
            child: Text((text) {
              return text == '/shrug' ? '¯\\_(ツ)_/¯' : text;
            } (_message.text.trim()), style: TextStyle(color: Colors.white)),
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
            width: 222.0,
            decoration: BoxDecoration(color: _message.whom == clientID ? Color(0xFFe25d5b) : Colors.grey, borderRadius: BorderRadius.circular(7.0)),
          ),
        ],
        mainAxisAlignment: _message.whom == clientID ? MainAxisAlignment.end : MainAxisAlignment.start,
      );
    }).toList();

    return Scaffold(
        appBar: AppBar(
            title: (
                isConnecting ? Text('Connecting to device') :
                isConnected ? Text('Receiving data ') :
                Text('...')
            )
        ),
        body: SafeArea(
            child: Column(
                children: <Widget>[
                  Flexible(
                      child: ListView(
                          padding: const EdgeInsets.all(12.0),
                          controller: listScrollController,
                          children: list
                      )
                  ),
                  Row(
                      children: <Widget>[
                        Flexible(
                            child: Center(
                                //margin: const EdgeInsets.only(left: 16.0),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  onPressed: () => _onBasicAlertPressed(context),
                                  padding: EdgeInsets.all(12),
                                  color: Color(0xFFe25d5b),
                                  child: Text('Check for abnormalies', style: TextStyle(color: Colors.white,)),
                                ),
                            )
                        ),

                      ]
                  )
                ]
            )
        )
    );
  }

  int t1 = 0;
  String t2 = "";
  int t3 = 0;

  void onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
        t1 = data[i];
      }
      else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
          t1 = data[i];
        }
        else {
          buffer[--bufferIndex] = data[i];
          t1 = data[i];
        }
      }
    }

    // Create message if there is new line character
    String dataString = String.fromCharCodes(buffer);
    int index = buffer.indexOf(13);
    if (~index != 0) { // \r\n
      setState(() {
        messages.add(_Message(1,
            backspacesCounter > 0
                ? messageBuffer.substring(0, messageBuffer.length - backspacesCounter)
                : messageBuffer
                + dataString.substring(0, index)
        ));
        messageBuffer = dataString.substring(index);
        t2 = messageBuffer;
      });
    }
    else {
      messageBuffer = (
          backspacesCounter > 0
              ? messageBuffer.substring(0, messageBuffer.length - backspacesCounter)
              : messageBuffer
              + dataString
      );
      t2 = messageBuffer;
    }
  }

  _onBasicAlertPressed(context) {
    String msg = "";
    if(t1>=53 && t1<=55)
    {
      t3 = t1-18;
      msg = "Warning! Low temperature";
      Alert(
          context: context,
          type: AlertType.error,
          title: "Not healthy",
          desc: t3.toString()+" celcius\n"+msg)
          .show();
    }
    else if(t1>=56 && t1<=57)
    {
      t3 = t1-18;
      msg = "Perfect Temperature";
      Alert(
          context: context,
          type: AlertType.success,
          title: "Healthy",
          desc: t3.toString()+" celcius\n"+msg)
          .show();
    }
    else if(t1>=48 && t1<=52)
    {
      t3 = t1-8;
      msg = "Warning! High temperature";
      Alert(
          context: context,
          type: AlertType.error,
          title: "Not Healthy",
          desc: t3.toString()+" celcius\n"+msg)
          .show();
    }
    else
      {
        msg = "Please place the device correctly";
        Alert(
            context: context,
            type: AlertType.warning,
            title: "Something wrong",
            desc: t1.toString()+"\n"+msg)
            .show();
      }

  }

  void _sendMessage(String text) async {
    text = text.trim();
    textEditingController.clear();

    if (text.length > 0)  {
      try {
        connection.output.add(utf8.encode(text + "\r\n"));
        await connection.output.allSent;

        setState(() {
          messages.add(_Message(clientID, text));
        });

        Future.delayed(Duration(milliseconds: 333)).then((_) {
          listScrollController.animateTo(listScrollController.position.maxScrollExtent, duration: Duration(milliseconds: 333), curve: Curves.easeOut);
        });
      }
      catch (e) {
        // Ignore error, but notify state
        setState(() {});
      }
    }
  }
}
