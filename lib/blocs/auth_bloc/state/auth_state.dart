import 'package:equatable/equatable.dart';
import 'package:flutter_repo/models/auth-user.dart';


abstract class AuthState extends Equatable {
    const AuthState();
}


class IntialAuthState extends AuthState {
  const IntialAuthState();
  @override
  List<Object> get props => [];

}

class InitializeLoginState extends AuthState {
  const InitializeLoginState();

  @override
  List<Object> get props => [];

}

class LoginCompletedState extends AuthState {
  final AuthUser user;
  const LoginCompletedState(this.user);
  
  @override
  List<Object> get props => [user];
  
}

class LoginFailedState extends AuthState {
  final String message;
  LoginFailedState(this.message);


  @override
  List<Object> get props => [message];


}

class InitializeRegisterState extends AuthState {
  const InitializeRegisterState();

  @override
  List<Object> get props => [];

}

class RegisterCompletedState extends AuthState {
  final AuthUser user;
  const RegisterCompletedState(this.user);
  
  @override
  List<Object> get props => [user];
  
}

class RegisterFailedState extends AuthState {
  final String message;
  RegisterFailedState(this.message);


  @override
  List<Object> get props => [message];


}