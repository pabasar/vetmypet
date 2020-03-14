import 'package:flutter/material.dart';
import 'package:vettest2/detect2.dart';
import 'login.dart';
import 'sign_up.dart';
import 'detect2.dart';
import 'controller.dart';

void main()
{

  const MaterialColor buttonTextColor = const MaterialColor(
    0xFF217872,
    const <int, Color>{
      50: const Color(0xFF217872),
      100: const Color(0xFF217872),
      200: const Color(0xFF217872),
      300: const Color(0xFF217872),
      400: const Color(0xFF217872),
      500: const Color(0xFF176F84),
      600: const Color(0xFF176F84),
      700: const Color(0xFF176F84),
      800: const Color(0xFF176F84),
      900: const Color(0xFF176F84),
    },
  );

  runApp(new MaterialApp(
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/login': (context) => Login(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/signUp': (context) => SignUp(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/vet': (context) => Detect2(),
      '/monitor': (context) => Controller(),
    },



    theme: ThemeData(
      //primaryColor: Color(0xFFe25d5b),
      //primaryColorDark: Color(0xFFe63c37),
      //hoverColor: Color(0xFFe25d5b),
      //dialogBackgroundColor: Color(0xFFe25d5b),
      //primaryColorLight: Color(0xFFe63c37),
      primarySwatch: buttonTextColor,
      accentColor: Color(0xFF176F84),
      fontFamily: 'WorkSans',
    ),
    title: "Fido",
    //home: new Login(),
    home: Login(),
  ));
}