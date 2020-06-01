import 'package:flutter/material.dart';
import 'package:flutter_repo/blocs/savings_bloc/savings_bloc.dart';

class SavingsCategoryProvider extends InheritedWidget {
  final SavingsCategoryBloc bloc;

  SavingsCategoryProvider({Key key, Widget child})
      : bloc = SavingsCategoryBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static SavingsCategoryBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType()
            as SavingsCategoryProvider)
        .bloc;
  }
}
