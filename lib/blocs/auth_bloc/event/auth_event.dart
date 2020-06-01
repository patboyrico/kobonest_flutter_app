import 'package:equatable/equatable.dart';


abstract class AuthEvent extends Equatable {
      const AuthEvent();
}


class DoLogin extends AuthEvent {
    final dynamic data;
    
    DoLogin(this.data);

    @override
    List<Object> get props => [data];
  
}


class DoRegister extends AuthEvent {
    final dynamic data;
    
    DoRegister(this.data);

    @override
    List<Object> get props => [data];
  
}