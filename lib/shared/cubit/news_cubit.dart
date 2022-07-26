import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/module/business/business_screen.dart';
import 'package:news_app/module/science/science_screen.dart';
import 'package:news_app/module/settings/settings_screen.dart';
import 'package:news_app/module/sports/sports_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(BuildContext context) => BlocProvider.of(context);

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    loadNews();
    emit(NewsBottomNavState());
  }

  void loadNews() {
    switch (screens[_currentIndex].runtimeType) {
      case BusinessScreen:
      if (business.isEmpty) getBuisness();
      break;
      case SportsScreen:
      if (sports.isEmpty) getSports();
      break;
      case ScienceScreen:
      if (science.isEmpty) getScience();
      break;
    }
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

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  void getBuisness() {
    emit(NewsLoadingBusinessStates());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '47355753fedb4385a45c18f51f87d690',
      },
    ).then((value) {
      // print(value.toString());
      // business = value.data['articles'];
      business = value.data['articles'];
      emit(NewGetBusinessSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewGetBusinessErrorState(onError.toString()));
    });
  }

  void getSports() {
    emit(NewsLoadingBusinessStates());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '47355753fedb4385a45c18f51f87d690',
      },
    ).then((value) {
      // print(value.toString());
      // business = value.data['articles'];
      sports = value.data['articles'];
      emit(NewGetSportsSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewGetSportsErrorState(onError.toString()));
    });
  }

  void getScience() {
    emit(NewsLoadingScienceStates());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '47355753fedb4385a45c18f51f87d690',
      },
    ).then((value) {
      // print(value.toString());
      // business = value.data['articles'];
      science = value.data['articles'];
      emit(NewGetScienceSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewGetScienceErrorState(onError.toString()));
    });
  }
}
