import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repos/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<ProcessLoginEvent>(processLoginEvent);
    on<ProcessSignupEvent>(processSignupEvent);
  }

  FutureOr<void> processLoginEvent(
      ProcessLoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    print(event.email);
    print(event.password);

    try {
      final result =
          await _authRepository.requestLogin(event.email, event.password);
      emit(LoginLoadedState());
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  FutureOr<void> processSignupEvent(
      ProcessSignupEvent event, Emitter<AuthState> emit) async {
    emit(SignupLoadingState());
    try {
      final result =
          await _authRepository.requestSignup(event.email, event.password);
      emit(SignupLoadedState());
    } catch (e) {
      emit(SignupErrorState(e.toString()));
    }
  }
}
