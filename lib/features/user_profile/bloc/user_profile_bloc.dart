import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dating_app/features/user_profile/models/user_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repos/user_profile_repo.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserProfileRepo _userRepository;
  UserProfileBloc(this._userRepository) : super(UserProfileInitial()) {
    on<UserProfileFetchEvent>(userProfileFetchEvent);
  }

  FutureOr<void> userProfileFetchEvent(UserProfileFetchEvent event, Emitter<UserProfileState> emit) async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? id = prefs.getInt('id');
      final result = await _userRepository.getUser(id);
      emit(UserProfileFetch(result));
    } catch (e) {
      emit(UserProfileErrorState(e.toString()));
    }
  }
}
