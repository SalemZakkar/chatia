import 'package:bloc/bloc.dart';
import 'package:chatia/module_theme/model/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void changedTheme(int i) {
    ThemeManager.setTheme(i);
    emit(ThemeChanged(i));
  }
}

ThemeCubit themeCubit = ThemeCubit();
