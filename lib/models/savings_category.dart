import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SavingsCategory extends Equatable{
    final int id;
    final String name;

  SavingsCategory({
    @required this.id, 
    @required this.name
    });
 
 factory SavingsCategory.fromJson(Map<dynamic, dynamic> json){
    return SavingsCategory(id: json['id'], name: json['name']);
 }
 
  @override
  List<Object> get props => [name, id];

}