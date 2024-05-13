import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../user_profile/models/user_model.dart';
import '../repos/user_connections_repo.dart';
import 'package:dating_app/data.dart';

part 'user_connections_event.dart';
part 'user_connections_state.dart';

class UserConnectionsBloc extends Bloc<UserConnectionsEvent, UserConnectionsState> {
  final UserConnectionsRepo _userConnectionsRepo;
  UserConnectionsBloc(this._userConnectionsRepo) : super(UserConnectionsInitial()) {
    on<UserConnectionsFetchEvent>(userConnectionsFetchEvent);
  }

  FutureOr<void> userConnectionsFetchEvent(UserConnectionsFetchEvent event, Emitter<UserConnectionsState> emit) async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? id = prefs.getInt('id');
      final resultId = await _userConnectionsRepo.getConnectionsId(id);
      if (resultId.isNotEmpty) {
        final result = await _userConnectionsRepo.getConnectionsInfo(resultId);
        emit(UserConnectionsFetch(result));
      } else {
        emit(UserConnectionsErrorState('У вас ще немає взаємних вподобань'));
      }


    } catch (e) {
      emit(UserConnectionsErrorState(e.toString()));
    }
  }
}
