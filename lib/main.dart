import 'package:flutter/material.dart';

import 'Screens/HomePage.dart';
import 'Screens/chat.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => const Homepage(),
      "page_2": (context) => const Chat_Page(),
    },
  ));
}


