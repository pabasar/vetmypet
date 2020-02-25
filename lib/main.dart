import 'package:flutter/material.dart';
import 'package:vettest2/detect2.dart';
import 'login.dart';
import 'sign_up.dart';
import 'add_pet.dart';
import 'detect2.dart';
import 'MainPage.dart';

void main()
{

  const MaterialColor buttonTextColor = const MaterialColor(
    0xFFe25d5b,
    const <int, Color>{
      50: const Color(0xFFe25d5b),
      100: const Color(0xFFe25d5b),
      200: const Color(0xFFe25d5b),
      300: const Color(0xFFe25d5b),
      400: const Color(0xFFe25d5b),
      500: const Color(0xFFe63c37),
      600: const Color(0xFFe63c37),
      700: const Color(0xFFe63c37),
      800: const Color(0xFFe63c37),
      900: const Color(0xFFe63c37),
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
      '/addPet': (context) => AddPet(),
      '/vet': (context) => Detect2(),
      '/monitor': (context) => MainPage(),
    },



    theme: ThemeData(
      //primaryColor: Color(0xFFe25d5b),
      //primaryColorDark: Color(0xFFe63c37),
      //hoverColor: Color(0xFFe25d5b),
      //dialogBackgroundColor: Color(0xFFe25d5b),
      //primaryColorLight: Color(0xFFe63c37),
      primarySwatch: buttonTextColor,
      accentColor: Color(0xFFe25d5b),
      fontFamily: 'WorkSans',
    ),
    title: "Fido",
    //home: new Login(),
    home: Login(),
  ));
}