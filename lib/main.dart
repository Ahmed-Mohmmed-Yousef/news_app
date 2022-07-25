import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/layout/news_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: Colors.black87,
            opacity: 0.5,
            // size: 30,
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          selectedItemColor: Colors.deepOrange,
        )
      ),
      home: const NewsLayout(),
    );
  }
}

  