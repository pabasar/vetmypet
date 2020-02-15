import 'package:flutter/material.dart';
import './MainPage.dart';
import 'detect2.dart';
import './SelectBondedDevicePage.dart';
import './ChatPage.dart';
import 'dart:async';

void main()
{
  runApp(new MaterialApp(
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/monitor': (context) => MainPage(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      //'/detect2': (context) => Detect2(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      //'/addPet': (context) => AddPet(),
    },

    theme: ThemeData(
      fontFamily: 'WorkSans',
      primaryColor: Colors.teal,
      primaryColorDark: Colors.teal[700],
      accentColor: Colors.teal[300],
    ),
    title: "Vet My Pet",
    debugShowCheckedModeBanner: true,
    home: Detect2(),
  ));
}




