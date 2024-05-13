part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class ProcessLoginEvent extends AuthEvent {
  final String email;
  final String password;

  ProcessLoginEvent(this.email, this.password);
}

class ProcessSignupEvent extends AuthEvent {
  final String email;
  final String password;

  ProcessSignupEvent(this.email, this.password);
}
