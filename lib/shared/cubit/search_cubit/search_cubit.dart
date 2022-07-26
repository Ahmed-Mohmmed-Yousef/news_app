import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  List<dynamic> results = [];

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  void search(String txt) {
    emit(SearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': txt,
        'apiKey': '47355753fedb4385a45c18f51f87d690',
      },
    ).then((value) {
      results = value.data['articles'];
      emit(SearchLSuccessState());
    }).catchError((onError) {
      emit(SearchLErrorState(onError.toString()));
    });
  }
}
