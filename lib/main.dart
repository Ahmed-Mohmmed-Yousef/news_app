import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/cubit/app_cubit/app_cubit.dart';
import 'package:news_app/shared/network/local/cach_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              secondaryHeaderColor: Colors.grey,
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
                elevation: 0.0,
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.deepOrange),
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
                elevation: 20.0,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              secondaryHeaderColor: Colors.grey,
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
                elevation: 0.0,
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                iconTheme: const IconThemeData(color: Colors.deepOrange),
                actionsIconTheme: const IconThemeData(
                  color: Colors.white,
                  opacity: 0.8,
                  // size: 30,
                ),
                centerTitle: false,
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                elevation: 20.0,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: cubit.isLightMode ? ThemeMode.light : ThemeMode.dark,
            home: Directionality(
              textDirection: cubit.isRtl ? TextDirection.rtl : TextDirection.ltr,
              child: const NewsLayout(),
            ),
          );
        },
      ),
    );
  }
}
