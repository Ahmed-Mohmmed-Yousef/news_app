part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class AppLightModeChanged extends AppState {}
class AppDirectionChanged extends AppState {}
