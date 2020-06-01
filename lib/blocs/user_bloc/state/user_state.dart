import 'package:equatable/equatable.dart';
import 'package:flutter_repo/models/auth-user.dart';

abstract class UserState extends Equatable{
    const UserState();
}

class InitializeGetUserState implements UserState {
  @override
  List<Object> get props => [];

}

class GetUserCompletedState implements UserState {
  final AuthUser user;
  GetUserCompletedState(this.user);
  
  @override
  List<Object> get props => [user];

}

class GetUserFailedState extends UserState {
  final String message;
  GetUserFailedState(this.message);


  @override
  List<Object> get props => [message];


}