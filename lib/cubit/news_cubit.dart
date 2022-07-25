import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/module/business/business_screen.dart';
import 'package:news_app/module/science/science_screen.dart';
import 'package:news_app/module/settings/settings_screen.dart';
import 'package:news_app/module/sports/sports_screen.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(BuildContext context) => BlocProvider.of(context);

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    emit(NewsBottomNavState());
  }

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
}
