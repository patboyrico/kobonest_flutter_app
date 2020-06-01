import 'package:flutter/material.dart';
import 'package:flutter_repo/screens/login/login.dart';
import 'package:flutter_repo/screens/register/register.dart';
import 'package:flutter_repo/utils/account_clipper.dart';
import 'package:flutter_repo/utils/size_config.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> heroAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));

    heroAnimation = Tween<double>(begin: -40, end: 0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn));

    animationController.forward(from: 0);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopBar(),
            SizedBox(height: 20.0,),
            BottomBar(),
          ]),
    );
  }
}

class TopBar extends StatefulWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AccountClipper(),
      child: Container(
        height: SizeConfig.heightMultiplier * 70,
        child: Stack(
          children: <Widget>[
            Positioned(
                // left: -60,
                // top: -200,
                child: Image.asset('assets/images/savings.jpg',
                    fit: BoxFit.cover, height: 1800)),
            Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.height,
                  height: SizeConfig.heightMultiplier * 40,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xff6f3682).withOpacity(.8),
                    Color(0xff9f44d3).withOpacity(.53),
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                )
              ),
              Positioned(
                left: 40,
                top: 60,
                child: Column(
                  children: <Widget>[
                     Text(
                      "Getting Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        // fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      "kobonest",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ],
                )
                )
          ],
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // SizedBox(
          //   height: MediaQuery.of(context).size.height / 6,
          // ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            width: double.infinity,
            child: RaisedButton(
              // elevation: 5.0,
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen())),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
              ),
              padding: EdgeInsets.all(15.0),
              color: Colors.white,
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.purple,
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            width: double.infinity,
            child: RaisedButton(
              // elevation: 5.0,
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen())),
               shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
              ),
              padding: EdgeInsets.all(15.0),
              color: Colors.purple,
              child: Text(
                'REGISTER',
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
          SizedBox(height: 30.0)
        ],
      ),
    );
  }
}
