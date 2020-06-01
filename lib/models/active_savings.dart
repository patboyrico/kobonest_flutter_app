import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class ActiveSavings extends Equatable {
  final String name;
  final String category;
  final String description;
  final String amount;

  ActiveSavings({
            @required this.name, 
            @required this.category, 
            @required this.description, 
            @required this.amount
          });

  factory ActiveSavings.fromJson(Map<dynamic, dynamic> json){
      return ActiveSavings(
        name: json['name'],
        category: json['category'],
        description: json['description'],
        amount: json['amount']
      );
  }

  @override
  List<Object> get props => [name, category, description, amount];

}


final List<ActiveSavings> activeSavingsList = [
    ActiveSavings(name: 'School Fees Savings', category: 'Fees', description: 'Savings towards my end of the session school fees', amount: '25,000.00'),
    ActiveSavings(name: 'Luxury Apartment', category: 'Accomodation', description: 'Savings towards my allowance for my luxury apartment', amount: '15,000.00'),
];