part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsBottomNavState extends NewsState {}

class NewsLoadingBusinessStates extends NewsState {}

class NewGetBusinessSuccessState extends NewsState {}

class NewGetBusinessErrorState extends NewsState {
  final String error;
  NewGetBusinessErrorState(this.error);
}
class NewsLoadingSportsStates extends NewsState {}

class NewGetSportsSuccessState extends NewsState {}

class NewGetSportsErrorState extends NewsState {
  final String error;
  NewGetSportsErrorState(this.error);
}
class NewsLoadingScienceStates extends NewsState {}

class NewGetScienceSuccessState extends NewsState {}

class NewGetScienceErrorState extends NewsState {
  final String error;
  NewGetScienceErrorState(this.error);
}

