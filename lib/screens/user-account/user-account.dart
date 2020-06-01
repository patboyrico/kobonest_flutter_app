import 'package:flutter/material.dart';
import 'package:flutter_repo/screens/dashboard/dashboard.dart';
import 'package:flutter_repo/utils/painter.dart';
import 'package:flutter_repo/utils/size_config.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Color(0xFFf3f1f1),
              child: Container(
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TopBar(),
                      SizedBox(height: 1 * SizeConfig.heightMultiplier),
                      BottomBar(),
                    ]),
              ),
            ),
          ),
        );
      });
    });
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvePainter(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Welcome Back!',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 3.5 * SizeConfig.textMultiplier),
              ),
            ],
          ),
          SizedBox(
            height: 6 * SizeConfig.heightMultiplier
            ),
          CircleAvatar(
            radius: 9 * SizeConfig.textMultiplier,
            backgroundImage: AssetImage('assets/images/person.jpg'),
          ),
          SizedBox(height: 10.0),
          TextField(
            decoration: InputDecoration(
                labelText: 'PASSWORD ',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 1.5 * SizeConfig.textMultiplier,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple))),
            obscureText: true,
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              elevation: 5.0,
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen())),
              padding: EdgeInsets.all(15.0),
              color: Colors.purple,
              child: Text(
                'LOGIN',
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
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
