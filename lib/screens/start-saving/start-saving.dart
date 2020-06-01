import 'package:flutter/material.dart';
import 'package:flutter_repo/blocs/savings_bloc/savings_bloc.dart';
import 'package:flutter_repo/blocs/savings_bloc/savings_provider.dart';
import 'package:flutter_repo/models/savings_category.dart';
import 'package:flutter_repo/utils/credit_card_dialog.dart';
import 'package:flutter_repo/utils/dashboard_clipper.dart';
import 'package:flutter_repo/utils/size_config.dart';

class StartSavingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SavingsCategoryProvider(
      child: StartSavingPage(),
    );
  }
}

class StartSavingPage extends StatefulWidget {
  @override
  _StartSavingPageState createState() => _StartSavingPageState();
}

class _StartSavingPageState extends State<StartSavingPage> {
  final SavingsCategoryBloc bloc = SavingsCategoryBloc();

  TextEditingController amountController = TextEditingController();
  TextEditingController maturityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  SavingsCategory category;
  var savingSource;
  var makeRecurrent;

  @override
  void initState() {
    bloc.fetchSavingsCategories();
    super.initState();
  }

  saveDetails() {
    if (maturityController.text.trim().isEmpty) {
      print('yuck!');
    }

    print('hmmm');

    var data = {
      'amount': amountController.text,
      'category': category.id,
      'recurrent': makeRecurrent,
      'saving_source': savingSource,
      'maturity': maturityController.text,
      'description': descriptionController.text
    };
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeee9f1),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: DashboardClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Color(0xff6f3682).withOpacity(.8),
                          Color(0xff9f44d3).withOpacity(.53),
                        ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                    height: 35 * SizeConfig.heightMultiplier,
                  ),
                ),
                Positioned(
                    top: 40.0,
                    child: Container(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            Text(
                              'Start Saving',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                            Column(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.brown.shade800,
                                  child: Text('AH'),
                                ),
                              ],
                            )
                          ]),
                    )),
                Positioned(
                  child: Container(
                    height: 97 * SizeConfig.heightMultiplier,
                    margin:
                        EdgeInsets.only(top: 130.0, left: 20.0, right: 20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Fill In The Following Details',
                                  style: TextStyle(
                                      fontSize: 2.5 * SizeConfig.textMultiplier,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.purple),
                                ),
                              ],
                            )),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          child: TextField(
                            onChanged: (String value) => bloc.amountSink,
                            keyboardType: TextInputType.number,
                            controller: amountController,
                            decoration: InputDecoration(
                                labelText: 'AMOUNT TO SAVE ',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 2.1 * SizeConfig.textMultiplier,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          child: StreamBuilder<List<SavingsCategory>>(
                              stream: bloc.savingsCategories,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return DropdownButton<String>(
                                    items: [
                                      DropdownMenuItem<String>(
                                        child: Text('No Savings Category'),
                                        value: '',
                                      ),
                                    ],
                                    onChanged: (String value) {
                                      setState(() {});
                                    },
                                    isExpanded: true,
                                    hint: Text(
                                      'SAVING FOR?',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.grey),
                                    ),
                                  );
                                }
                                return DropdownButton(
                                  value: category,
                                  items: snapshot.data
                                      .map<DropdownMenuItem<SavingsCategory>>(
                                          (category) {
                                    return DropdownMenuItem(
                                      child: Text('${category.name}'),
                                      value: category,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    bloc.categorySink;
                                    setState(() {
                                      category = value;
                                    });
                                  },
                                  isExpanded: true,
                                  hint: Text(
                                    'SAVING FOR?',
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.grey),
                                  ),
                                );
                                // return Text('data');
                              }),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          child: DropdownButton<String>(
                            value: savingSource,
                            items: [
                              DropdownMenuItem<String>(
                                child: Text('Save From Wallet'),
                                value: 'wallet',
                              ),
                              DropdownMenuItem<String>(
                                child: Text('Save With Card'),
                                value: 'card',
                              ),
                            ],
                            onChanged: (String value) {
                               bloc.savingSourceSink;
                              setState(() {
                                savingSource = value;
                              });
                            },
                            isExpanded: true,
                            hint: Text(
                              'SAVING SOURCE?',
                              style:
                                  TextStyle(fontSize: 15.0, color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          child: DropdownButton<String>(
                            value: makeRecurrent,
                            items: [
                              DropdownMenuItem<String>(
                                child: Text('No'),
                                value: 'no',
                              ),
                              DropdownMenuItem<String>(
                                child: Text('Yes'),
                                value: 'yes',
                              ),
                            ],
                            onChanged: (String value) {
                              bloc.recurrentSink;
                              setState(() {
                                makeRecurrent = value;
                              });
                            },
                            isExpanded: true,
                            hint: Text(
                              'RECURRENT?',
                              style:
                                  TextStyle(fontSize: 15.0, color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          child: TextField(
                            onChanged: (String value) => bloc.maturitySink,
                            keyboardType: TextInputType.number,
                            controller: maturityController,
                            // controller: _phoneNumberController,
                            decoration: InputDecoration(
                                labelText: 'MATURITY PERIOD(In Months)',

                                // hintText: 'You will not be required to pay a 10% fine if you withdraw prior to this time',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 2.1 * SizeConfig.textMultiplier,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          child: TextField(
                            onChanged: (String value)  => bloc.descriptionSink,
                            controller: descriptionController,
                            keyboardType: TextInputType.multiline,
                            // controller: _phoneNumberController,
                            decoration: InputDecoration(
                                labelText: 'DESCRIPTION',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 2.1 * SizeConfig.textMultiplier,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                          width: double.infinity,
                          child: StreamBuilder(
                              stream: bloc.amountStream,
                              builder: (context, snapshot) {
                                return RaisedButton(
                                  elevation: 5.0,
                                  onPressed: snapshot.hasData
                                      ? () => print('hi')
                                      : null,
                                  padding: EdgeInsets.all(15.0),
                                  color: Colors.purple,
                                  child: Text(
                                    'SAVE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1.5,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}

showCreditCardDialog(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => CreditCardDialog(),
  );
}
