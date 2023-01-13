import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:outshadedm/models/user.dart';
import 'package:outshadedm/repository/userrepository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc(this.userRepository) : super(UserInitial()) {
    on<FetchUser>((event, emit) async {
      List<User> users = await userRepository.getUsers();
      if (users.isEmpty) {
        emit(UserFailed());
      } else {
        emit(UserFetchedSuccessful(users: users));
      }
    });
  }
}
