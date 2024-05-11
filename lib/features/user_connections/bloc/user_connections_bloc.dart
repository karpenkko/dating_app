import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../user_profile/models/user_model.dart';
import '../repos/user_connections_repo.dart';

part 'user_connections_event.dart';
part 'user_connections_state.dart';

class UserConnectionsBloc extends Bloc<UserConnectionsEvent, UserConnectionsState> {
  final UserConnectionsRepo _userConnectionsRepo;
  UserConnectionsBloc(this._userConnectionsRepo) : super(UserConnectionsInitial()) {
    on<UserConnectionsFetchEvent>(userConnectionsFetchEvent);
  }

  FutureOr<void> userConnectionsFetchEvent(UserConnectionsFetchEvent event, Emitter<UserConnectionsState> emit) async{
  }
}
