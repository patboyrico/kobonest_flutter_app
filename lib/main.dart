import 'package:flutter/material.dart';
import 'package:flutter_repo/data/token_repository.dart';
import 'package:flutter_repo/screens/onboarding/onboarding.dart';
import 'package:flutter_repo/screens/user-account/user-account.dart';
import 'package:flutter_repo/themes/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var token = TokenRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: token.hasToken() ? Onboarding() : UserAccount(),
    );
  }
}


