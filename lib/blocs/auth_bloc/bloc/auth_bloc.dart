import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_repo/data/auth_repository.dart';
import '../../bloc.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository);

  @override
  AuthState get initialState => IntialAuthState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
        yield InitializeLoginState();
        if (event is DoLogin) {
            try {
              final user = await authRepository.doLogin(event.data);
              yield LoginCompletedState(user);
            } catch (e) {
              print(e);
              yield LoginFailedState('Invalid Login Details, Please Try again or Reset Password');
            }
        } else if (event is DoRegister) {
              try {
              final user = await authRepository.doRegister(event.data);
              yield RegisterCompletedState(user);
            } catch (e) {
              print(e);
              yield RegisterFailedState('Your Registration could not be completed, please try again later');
            }
        }
  }
}