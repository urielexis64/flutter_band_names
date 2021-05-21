import 'package:band_names_app/src/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BandNames App',
      initialRoute: '/',
      routes: {'/': (context) => HomePage()},
    );
  }
}
