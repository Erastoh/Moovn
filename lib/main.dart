import 'package:flutter/material.dart';
// import 'package:moovntech/pages/MyHomepage.dart';
import 'package:moovntech/pages/MyMainHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moovn Tech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  MyMainHomepage(),
    );
  }
}
