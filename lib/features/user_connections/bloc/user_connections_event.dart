part of 'user_connections_bloc.dart';

@immutable
sealed class UserConnectionsEvent {}

final class UserConnectionsFetchEvent extends UserConnectionsEvent {}
