part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


class LoginLoadingState extends AuthState {
}

class LoginLoadedState extends AuthState {
  // final String accessToken;
  // LoginLoadedState(this.accessToken);
}

class LoginErrorState extends AuthState {
  final String error;
  LoginErrorState(this.error);
}

class SignupLoadingState extends AuthState {
}

class SignupLoadedState extends AuthState {
  SignupLoadedState();
}

class SignupErrorState extends AuthState {
  final String error;
  SignupErrorState(this.error);
}
