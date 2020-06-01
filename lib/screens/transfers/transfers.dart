import 'package:flutter/material.dart';

class TransfersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransfersPage();
  }
}

class TransfersPage extends StatefulWidget {
  @override
  _TransfersPageState createState() => _TransfersPageState();
}

class _TransfersPageState extends State<TransfersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[topBar(), bottomBar()],
            ),
          ),
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
