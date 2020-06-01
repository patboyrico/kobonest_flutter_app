import 'package:flutter_repo/data/savings_repository.dart';
import 'package:flutter_repo/models/savings_category.dart';
import 'package:rxdart/rxdart.dart';

class SavingsCategoryBloc {
  final repository = SavingsRepository();
  final _savingsCategories = PublishSubject<List<SavingsCategory>>();
  final savingSource = PublishSubject<String>();
  final isRecurrent = PublishSubject<String>();

  final amount = PublishSubject<int>();
  final maturity = PublishSubject<int>();
  final description  = PublishSubject<String>();
  final category  = PublishSubject<int>();


  Stream<List<SavingsCategory>> get savingsCategories => _savingsCategories.stream;
  Stream<String> get savingSourceStream => savingSource.stream;
  Stream<String> get recurrentStream => isRecurrent.stream;
  Stream<int> get amountStream => amount.stream;
  Stream<int> get categoryStream => category.stream;
  Stream<int> get maturityStream => maturity.stream;
  Stream<String> get descriptionStream => description.stream;

  Function(String) get savingSourceSink => savingSource.sink.add;
  Function(String) get recurrentSink => isRecurrent.sink.add;
  Function(int) get amountSink => amount.sink.add;
  Function(int) get categorySink => category.sink.add;
  Function(int) get maturitySink => maturity.sink.add;
  Function(String) get descriptionSink => description.sink.add;


  Stream<bool> get checkForm =>
      Rx.combineLatest5(amountStream, amountStream, amountStream, amountStream, amountStream, (a1, a2, a3, a4, a5) => false);
  

  fetchSavingsCategories() async {
      final categories = await repository.getSavingsCategory();
      _savingsCategories.sink.add(categories);
  }


  dispose(){
      _savingsCategories.close();
      savingSource.close();
      isRecurrent.close();
      amount.close();
      maturity.close();
      description.close();
      category.close();
  }

}