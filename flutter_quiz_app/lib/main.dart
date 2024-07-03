import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/home_page.dart';
import 'package:flutter_quiz_app/quiz_page.dart';

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
      title: ' Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      //  home: QuizPage(),
      home: HomePage(),
    );
  }
}
