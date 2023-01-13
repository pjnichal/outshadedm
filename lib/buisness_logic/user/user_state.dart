part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserFetchedSuccessful extends UserState {
  final List<User> users;
  UserFetchedSuccessful({
    required this.users,
  });
}

class UserFailed extends UserState {}
