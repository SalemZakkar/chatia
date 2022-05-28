part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}

class UserDone extends UserState {}

class UserInitialPhoto extends UserState {
  final String? url;
  UserInitialPhoto(this.url);
}
