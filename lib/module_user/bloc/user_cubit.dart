import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chatia/constants/app_string.dart';
import 'package:chatia/module_user/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:meta/meta.dart';

import '../models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(UserState initialState) : super(initialState);
  void reset() {
    emit(UserInitial());
  }
  void resetPhoto()
  {
    emit(UserInitialPhoto(fb.FirebaseAuth.instance.currentUser?.photoURL));
  }

  void signUp(User user) async {
    emit(UserLoading());
    String rep = await UserRepository.signUp(user);
    print(rep);
    if (rep == AppStrings.success) {
      emit(UserDone());
    } else {
      emit(UserError(rep));
    }
  }

  void signIn(User user) async {
    emit(UserLoading());
    String rep = await UserRepository.signIn(user);
    print(rep);
    if (rep == AppStrings.success) {
      emit(UserDone());
    } else {
      emit(UserError(rep));
    }
  }

  void changePhoto(File file) async {
    emit(UserLoading());
    String rep = await UserRepository.changePhoto(file);
    if (rep == AppStrings.success) {
      emit(UserDone());
    } else {
      emit(UserError(rep));
    }
  }

  void deletePhoto() async {
    emit(UserLoading());
    String rep = await UserRepository.deletePhoto();
    if (rep == AppStrings.success) {
      emit(UserDone());
    } else {
      emit(UserError(rep));
    }
  }
}
