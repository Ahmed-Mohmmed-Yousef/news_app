import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main() {
  DioHelper.init();
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
          primarySwatch: Colors.deepOrange,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange,
            elevation: 0.0,
          ),
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
          )),
      darkTheme: ThemeData(
          primarySwatch: Colors.deepOrange,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange,
            elevation: 0.0,
          ),
          scaffoldBackgroundColor: Colors.black87,
          appBarTheme: const AppBarTheme(
            actionsIconTheme: IconThemeData(
              color: Colors.black87,
              opacity: 0.5,
              // size: 30,
            ),
            centerTitle: false,
            backgroundColor: Colors.black87,
            elevation: 0.0,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.grey,
            elevation: 0.0,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.black54,
          )),
      themeMode: ThemeMode.light,
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: NewsLayout(),
      ),
    );
  }
}
