import 'package:flutter/material.dart';

class InvestmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InvestmentsPage();
  }
}

class InvestmentsPage extends StatefulWidget {
  @override
  _InvestmentsPageState createState() => _InvestmentsPageState();
}

class _InvestmentsPageState extends State<InvestmentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[topBar(), bottomBar()],
        ),
      ),
    );
  }
}

Widget topBar() {
  return Container();
}

Widget bottomBar() {
  return Container();
}
