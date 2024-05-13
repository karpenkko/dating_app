part of 'user_connections_bloc.dart';

@immutable
sealed class UserConnectionsState {}

final class UserConnectionsInitial extends UserConnectionsState {}

final class UserConnectionsFetch extends UserConnectionsState {
  final List<UserModel> users;
  UserConnectionsFetch(this.users);
}

class UserConnectionsErrorState extends UserConnectionsState {
  final String error;
  UserConnectionsErrorState(this.error);
}
