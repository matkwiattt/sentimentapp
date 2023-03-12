import 'package:flutter/material.dart';
import 'package:sentimentapp/pages/home_page.dart';
import 'package:sentimentapp/pages/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(fontFamily: 'SourceCodePro'),
        initialRoute: 'home',
        routes: {
          'home': (context) => HomePage(),
          'result': (context) => ResultPage()
        });
  }
}
