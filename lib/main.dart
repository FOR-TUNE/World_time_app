// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading .dart';
import 'pages/choose_location.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    initialRoute: '/', // to overide the default '/' route
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/Location': (context) => ChooseLocation(),
    },
  ));
}
