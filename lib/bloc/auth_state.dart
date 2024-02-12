part of 'auth_bloc.dart';


sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthTrabbleState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthLoadedState extends AuthState {}

final class AnonymRegisterState extends AuthState {
  UserModel user;
  AnonymRegisterState({required this.user});
}

final class FullRegisterState extends AuthState {
  UserModel user;
  FullRegisterState({required this.user});
}

