import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dating_app/features/user_profile/models/user_model.dart';
import 'package:meta/meta.dart';

import '../repos/user_profile_repo.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserProfileRepo _userRepository;
  UserProfileBloc(this._userRepository) : super(UserProfileInitial()) {
    on<UserProfileFetchEvent>(userProfileFetchEvent);
  }

  FutureOr<void> userProfileFetchEvent(UserProfileFetchEvent event, Emitter<UserProfileState> emit) async{

  }
}
