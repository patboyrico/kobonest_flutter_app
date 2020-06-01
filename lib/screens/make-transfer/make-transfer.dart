import 'package:flutter/material.dart';
import 'package:flutter_repo/utils/size_config.dart';

class MakeTransfersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MakeTransferPage();
  }
}

class MakeTransferPage extends StatefulWidget {
  @override
  _MakeTransferPageState createState() => _MakeTransferPageState();
}

class _MakeTransferPageState extends State<MakeTransferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeee9f1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Make Transfer'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () => print('object')),
        ],
      ),
      body: SingleChildScrollView(
        child: transferForm(),
      ),
    );
  }
}

Widget transferForm() {
  return Container(
    margin: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25.0))),
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[Text('Make Transfer From Account')],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: TextField(
            keyboardType: TextInputType.number,
            // controller: _phoneNumberController,
            decoration: InputDecoration(
                labelText: 'AMOUNT TO TRANSFER ',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 1.5 * SizeConfig.textMultiplier,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple))),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: TextField(
            keyboardType: TextInputType.number,
            // controller: _phoneNumberController,
            decoration: InputDecoration(
                labelText: 'ACCOUNT NUMBER',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 1.5 * SizeConfig.textMultiplier,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple))),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: TextField(
            keyboardType: TextInputType.number,
            // controller: _phoneNumberController,
            decoration: InputDecoration(
                labelText: 'ACCOUNT NAME',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 1.5 * SizeConfig.textMultiplier,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple))),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: TextField(
            keyboardType: TextInputType.number,
            // controller: _phoneNumberController,
            decoration: InputDecoration(
                labelText: 'DESCRIPTION',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 1.5 * SizeConfig.textMultiplier,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple))),
          ),
        ),
           Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(25.0))
                              ),
                          width: double.infinity,
                          child: RaisedButton(
                            
                            elevation: 5.0,
                            onPressed: () => print('s'),
                            padding: EdgeInsets.all(15.0),
                            color: Colors.purple,
                            child: Text(
                              'TRANSFER',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                          ),
                        ),
      ],
    ),
  );
}
