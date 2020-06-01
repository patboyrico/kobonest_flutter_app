import 'package:flutter/material.dart';

class StartInvestmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StartInvestmentPage();
  }
}

class StartInvestmentPage extends StatefulWidget {
  @override
  _StartInvestmentPageState createState() => _StartInvestmentPageState();
}

class _StartInvestmentPageState extends State<StartInvestmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                topbar(),
                investmentForm()
              ],)
          ), 
        ),
    );
  }
}

Widget topbar(){
      return Container();
}

Widget investmentForm(){
  return Container();
}