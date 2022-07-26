part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLSuccessState extends SearchState {}

class SearchLErrorState extends SearchState {
  final String error;

  SearchLErrorState(this.error);
}

class SearchLEmptyState extends SearchState {}
