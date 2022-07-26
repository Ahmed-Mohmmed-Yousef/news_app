import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/shared/network/local/cach_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  // bool _isLightMode = true;
  bool _isRtl = true;

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  bool get isLightMode => CachHelper.getData(key: 'isLightMode');

  set isLightMode(bool isLightMode) {
    CachHelper.putData(key: 'isLightMode', value: isLightMode)
        .then((value) => emit(AppLightModeChanged()));
  }

  bool get isRtl => CachHelper.getData(key: 'isRtl');

  set isRtl(bool isRtl) {
    CachHelper.putData(key: 'isRtl', value: isLightMode)
        .then((value) => emit(AppDirectionChanged()));
  }
}
