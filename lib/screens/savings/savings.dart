import 'package:flutter/material.dart';
import 'package:flutter_repo/models/active_savings.dart';
import 'package:flutter_repo/screens/start-saving/start-saving.dart';
import 'package:flutter_repo/utils/dashboard_clipper.dart';
import 'package:flutter_repo/utils/savings_card.dart';
import 'package:flutter_repo/utils/size_config.dart';

class SavingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SavingsPage();
  }
}

class SavingsPage extends StatefulWidget {
  @override
  _SavingsPageState createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage> {
  @override
  Widget build(BuildContext context) {
    return Savings();
  }
}

class Savings extends StatefulWidget {
  @override
  _SavingsState createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => StartSavingPage()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Color(0xffeee9f1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[topBar(context), bottomBar()],
            ),
          ),
        ),
      ),
    );
  }
}

Widget topBar(context) {
  return ClipPath(
    clipper: DashboardClipper(),
    child: Container(
      height: SizeConfig.heightMultiplier * 30,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: DashboardClipper(),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xff6f3682).withOpacity(.8),
                Color(0xff9f44d3).withOpacity(.53),
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
              height: 48 * SizeConfig.heightMultiplier,
            ),
          ),
          Positioned(
              top: 10.0,
              child: Container(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                width: MediaQuery.of(context).size.width,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Text(
                        'My Savings',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
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
              top: 70.0,
              child: Container(
                padding: EdgeInsets.only(left: 35.0, right: 15.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        'Savings Balance',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 1.7 * SizeConfig.textMultiplier),
                      ),
                      // Text('My Account', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                    ]),
                    SizedBox(height: 5.0),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        '₦10,00.00',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 4 * SizeConfig.textMultiplier),
                      ),
                      SizedBox(
                        width: 25.2 * SizeConfig.widthMultiplier,
                      ),

                      // Text('My Account', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                    ]),
                  ],
                ),
              )),
        ],
      ),
    ),
  );
}

Widget bottomBar() {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Active Savings',
                  style: TextStyle(
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.w800,
                      color: Colors.purple),
                ),
                Text(
                  'View',
                  style: TextStyle(
                      fontSize: 2 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.w700,
                      color: Colors.purple),
                )
              ],
            )),
        activeSavings(),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Activity',
                  style: TextStyle(
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.w800,
                      color: Colors.purple),
                ),
                Text(
                  'View',
                  style: TextStyle(
                      fontSize: 2 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.w700,
                      color: Colors.purple),
                )
              ],
            )),
        SizedBox(height: 20.0),
        savingsActivity(),
        SizedBox(height: 20.0)
      ],
    ),
  );
}

Widget activeSavings() {
  return Container(
    height: 30 * SizeConfig.heightMultiplier,
    width: double.infinity,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: activeSavingsList.length,
        itemBuilder: (BuildContext context, int index) {
          return savingsCard(context, activeSavingsList[index], index);
        }),
  );
}

Widget savingsActivity() {
  return Container(
    height: 30 * SizeConfig.heightMultiplier,
    padding: EdgeInsets.symmetric(horizontal: 15.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
    child: ListView.separated(
      itemCount: activeSavingsList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            child: Icon(
              Icons.account_balance,
              color: Colors.white,
              size: 3 * SizeConfig.textMultiplier,
            ),
          ),
          title: Text(
            'Withdraw From Savings',
            style: TextStyle(
                fontSize: 2.0 * SizeConfig.textMultiplier,
                fontWeight: FontWeight.w700,
                color: Colors.purple),
          ),
          subtitle: Text(
            'Dec 26',
            style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
                fontWeight: FontWeight.w300,
                color: Colors.purple),
          ),
          trailing: Text(
            '₦25,000.00',
            style: TextStyle(
                fontSize: 1.6 * SizeConfig.textMultiplier,
                color: Colors.purple,
                fontWeight: FontWeight.w600),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        thickness: 2.0,
      ),
    ),
  );
}
