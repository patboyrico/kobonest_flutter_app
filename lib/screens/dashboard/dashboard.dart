import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_repo/models/auth-user.dart';
import 'package:flutter_repo/screens/investments/investments.dart';
import 'package:flutter_repo/screens/make-transfer/make-transfer.dart';
import 'package:flutter_repo/screens/savings/savings.dart';
import 'package:flutter_repo/screens/start-investment/start-investment.dart';
import 'package:flutter_repo/screens/start-saving/start-saving.dart';
import 'package:flutter_repo/screens/transfers/transfers.dart';
import 'package:flutter_repo/utils/collapsible_drawer.dart';
import 'package:flutter_repo/utils/custom_dialog.dart';
import 'package:flutter_repo/utils/dashboard_clipper.dart';
import 'package:flutter_repo/utils/size_config.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class DashboardScreen extends StatelessWidget {
  final AuthUser user;
  DashboardScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dashboard(user: this.user);
  }
}

class Dashboard extends StatefulWidget {
  final AuthUser user;
  Dashboard({Key key, this.user}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: buildSpeedDial(context),
      drawer: CollapsibleDrawer(user: widget.user),
      backgroundColor: Color(0xffeee9f1),
      body: Container(
          child: Column(
        children: <Widget>[
          Stack(
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
                  top: 40.0,
                  child: Container(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.format_align_left,
                                color: Colors.white),
                            onPressed: () {
                              scaffoldKey.currentState.openDrawer();
                            },
                          ),
                          Text(
                            'My Account',
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
                  top: 100.0,
                  child: Container(
                    padding: EdgeInsets.only(left: 35.0, right: 15.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Wallet Balance',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 1.7 * SizeConfig.textMultiplier),
                              ),
                              // Text('My Account', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                            ]),
                        SizedBox(height: 5.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '₦' + widget.user.walletBalance ?? '',
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
              Positioned(
                  top: 26 * SizeConfig.heightMultiplier,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SavingsScreen())),
                              child: Column(children: <Widget>[
                                Container(
                                  height: 8 * SizeConfig.heightMultiplier,
                                  width: 8 * SizeConfig.heightMultiplier,
                                  child: Card(
                                    elevation: 10.0,
                                    color: Colors.white,
                                    child: Icon(
                                      EvaIcons.npmOutline,
                                      color: Colors.purple,
                                      size: 6 * SizeConfig.textMultiplier,
                                    ),
                                  ),
                                ),
                                Text('Savings',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            2 * SizeConfig.textMultiplier))
                              ]),
                            ),
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InvestmentsScreen())),
                                                          child: Column(
                                children: <Widget>[
                                Container(
                                  height: 8 * SizeConfig.heightMultiplier,
                                  width: 8 * SizeConfig.heightMultiplier,
                                  child: Card(
                                    color: Colors.white,
                                    child: Icon(
                                      EvaIcons.briefcaseOutline,
                                      color: Colors.purple,
                                      size: 6 * SizeConfig.textMultiplier,
                                    ),
                                  ),
                                ),
                                Text('Investments',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 2 * SizeConfig.textMultiplier))
                              ]),
                            ),
                          ),
                          Container(
                            child: Column(children: <Widget>[
                              Container(
                                height: 8 * SizeConfig.heightMultiplier,
                                width: 8 * SizeConfig.heightMultiplier,
                                child: Card(
                                  color: Colors.white,
                                  child: Icon(
                                    EvaIcons.activityOutline,
                                    color: Colors.purple,
                                    size: 6 * SizeConfig.textMultiplier,
                                  ),
                                ),
                              ),
                              Text('Transfers',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 2 * SizeConfig.textMultiplier))
                            ]),
                          ),
                        ],
                      )))
            ],
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Wallet',
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            child: Column(
              children: <Widget>[
                Container(
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.account_balance_wallet,
                      color: Colors.purple,
                      size: 5 * SizeConfig.textMultiplier,
                    ),
                    title: Text(
                      'Savings Balance',
                      style: TextStyle(
                          fontSize: 2.0 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.w700,
                          color: Colors.purple),
                    ),
                    subtitle: Text(
                      'Active',
                      style: TextStyle(
                          fontSize: 1.4 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.w300,
                          color: Colors.purple),
                    ),
                    trailing: Text(
                      '₦' + widget.user.savingsBalance ?? '',
                      style: TextStyle(
                          fontSize: 1.6 * SizeConfig.textMultiplier,
                          color: Colors.purple,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Container(
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0)),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.assistant,
                      color: Colors.purple,
                      size: 5 * SizeConfig.textMultiplier,
                    ),
                    title: Text(
                      'Investment',
                      style: TextStyle(
                          fontSize: 2.0 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.w700,
                          color: Colors.purple),
                    ),
                    subtitle: Text(
                      'Active',
                      style: TextStyle(
                          fontSize: 1.4 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.w300,
                          color: Colors.purple),
                    ),
                    trailing: Text(
                      '₦' + widget.user.investmentBalance ?? '',
                      style: TextStyle(
                          fontSize: 1.6 * SizeConfig.textMultiplier,
                          color: Colors.purple,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

SpeedDial buildSpeedDial(context) {
  return SpeedDial(
    marginRight: 18,
    marginBottom: 20,
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: IconThemeData(size: 22.0),
    closeManually: false,
    curve: Curves.bounceIn,
    overlayColor: Colors.black,
    overlayOpacity: 0.7,
    onOpen: () => print('OPENING DIAL'),
    onClose: () => print('DIAL CLOSED'),
    tooltip: 'Menu',
    heroTag: 'Menu',
    backgroundColor: Colors.purple,
    foregroundColor: Colors.white,
    elevation: 18.0,
    children: [
      SpeedDialChild(
          child: Icon(Icons.send),
          backgroundColor: Colors.purpleAccent,
          label: 'Make Transfer',
          labelStyle:
              TextStyle(fontSize: 18.0, backgroundColor: Colors.transparent),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MakeTransferPage()))
      ),
      SpeedDialChild(
        child: Icon(Icons.attach_money),
        backgroundColor: Colors.purpleAccent,
        label: 'Start Saving',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => StartSavingsScreen())),
      ),
      SpeedDialChild(
        child: Icon(Icons.account_balance),
        backgroundColor: Colors.purpleAccent,
        label: 'Invest Now',
        labelStyle: TextStyle(fontSize: 18.0),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => StartInvestmentsScreen())),
      ),
    ],
  );
}
