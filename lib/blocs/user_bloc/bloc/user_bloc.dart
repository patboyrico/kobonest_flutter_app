import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_repo/data/user_repository.dart';
import '../../bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository);

  @override
  get initialState => InitializeGetUserState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is GetUserEvent) {
      try {
        final user = await userRepository.getUser();
        print(user);
        yield GetUserCompletedState(user);
      } catch (e) {
        print(e);
        yield GetUserFailedState(
            'Could Not Communicate With The Servers Now, Please Try Again');
      }
    }
  }
}
