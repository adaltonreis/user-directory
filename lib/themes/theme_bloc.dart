import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

enum ThemeEvent { toggle }

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(_lightTheme) {
    on<ThemeEvent>((event, emit) {
      if (state.brightness == Brightness.light) {
        emit(_darkTheme);
      } else {
        emit(_lightTheme);
      }
    });
  }

  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.grey[100],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.grey[50],
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
    ),
  );

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.grey[850],
    ),
    cardTheme: CardThemeData(
      color: Colors.grey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
    ),
  );
}
