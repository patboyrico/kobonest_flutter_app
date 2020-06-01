import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AuthUser extends Equatable {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final int accountNumber;
  final String walletBalance;
  final String savingsBalance;
  final String investmentBalance;

  AuthUser(
      {@required this.firstName,
      @required this.lastName,
      @required this.phoneNumber,
      @required this.email,
      @required this.accountNumber,
      @required this.walletBalance,
      @required this.savingsBalance,
      @required this.investmentBalance});

  factory AuthUser.fromJson(Map<dynamic, dynamic> json) {
    return AuthUser(
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      accountNumber: json['accountNumber'],
      walletBalance: json['walletBalance'],
      savingsBalance: json['savingsBalance'],
      investmentBalance: json['investmentBalance'],
    );
  }

  @override
  List<Object> get props => [
        phoneNumber,
        firstName,
        lastName,
        email,
        walletBalance,
        savingsBalance,
        investmentBalance
      ];
}
