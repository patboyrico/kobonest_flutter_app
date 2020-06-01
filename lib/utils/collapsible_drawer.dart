import 'package:flutter/material.dart';
import 'package:flutter_repo/models/auth-user.dart';
import 'package:flutter_repo/utils/account_clipper.dart';
import 'package:flutter_repo/utils/painter.dart';

class CollapsibleDrawer extends StatefulWidget {
  final AuthUser user;

  const CollapsibleDrawer({Key key, this.user}) : super(key: key);

  @override
  _CollapsibleDrawerState createState() => _CollapsibleDrawerState();
}

class _CollapsibleDrawerState extends State<CollapsibleDrawer> {
  

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
        color: Colors.white,
        fontFamily: 'Nunito',
        fontSize: 18,
        fontWeight: FontWeight.w800);

    var textStyleTile = TextStyle(
        color: Colors.black,
        fontFamily: 'Nunito',
        fontSize: 15,
        fontWeight: FontWeight.w800);
    var white = Colors.white;
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Container(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            CustomPaint(
              painter: CurvePainter(),
              child: DrawerHeader(
                
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      // backgroundImage: AssetImage('assets/images/person.jpg'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.user.firstName+ ' ' +widget.user.lastName,
                      style: textStyle,
                    )
                  ],
                ),
              ),
            ),
            Column(children: <Widget>[]),
            ListTile(
              title: Text(
                'About Us',
                style: textStyleTile,
              ),
              trailing: Icon(
                Icons.wrap_text,
                color: Colors.black,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'SOS',
                style: textStyleTile,
              ),
              trailing: Icon(
                Icons.help,
                color: Colors.black,
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text(
                'Share',
                style: textStyleTile,
              ),
              trailing: Icon(
                Icons.share,
                color: Colors.black,
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text(
                'Settings',
                style: textStyleTile,
              ),
              trailing: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 11,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () => print('tapped'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Logout',
                      style: textStyleTile,
                    ),
                    Icon(
                      Icons.settings_power,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
