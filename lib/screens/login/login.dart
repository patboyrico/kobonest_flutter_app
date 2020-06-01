import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_repo/blocs/bloc.dart';

import 'package:flutter_repo/data/auth_repository.dart';
import 'package:flutter_repo/screens/dashboard/dashboard.dart';
import 'package:flutter_repo/screens/forgot-password/forgot-password.dart';
import 'package:flutter_repo/screens/register/register.dart';
import 'package:flutter_repo/utils/custom_dialog.dart';
import 'package:flutter_repo/utils/loading_indicator.dart';
import 'package:flutter_repo/utils/painter.dart';
import 'package:flutter_repo/utils/size_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
          create: (context) => AuthBloc(Auth()), child: LoginForm()),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFf3f1f1),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginCompletedState) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen(user: state.user)));
            } else if (state is LoginFailedState) {
              showDialog(
                context: context,
                builder: (BuildContext context) => CustomDialog(
                  title: "Oops",
                  description: state.message,
                  buttonText: "Close",
                ),
              );
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (BuildContext context, state) {
              if (state is IntialAuthState) {
                return mainLoginForm();
              } else if (state is InitializeLoginState) {
                return loadingIndicator();
              } else if (state is LoginFailedState) {
                return mainLoginForm();
              } else {
                return mainLoginForm();
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget mainLoginForm() {
  return Container(
    child: Column(children: [
      TopBar(),
      SizedBox(height: 5.0),
      BottomBar(),
    ]),
  );
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

class BottomBar extends StatefulWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void submitForm(BuildContext context) {
    final data = {
      'email': _emailController.text,
      'password': _passwordController.text
    };

    final authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(DoLogin(data));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: 'EMAIL',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 1.5 * SizeConfig.textMultiplier,
                    color: Colors.grey),
                // hintText: 'EMAIL',
                // hintStyle: ,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple))),
          ),
          SizedBox(height: 10.0),
          TextField(
            controller: _passwordController,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen())),
                  child: Text(
                    'Forgot Your Password?',
                    style: TextStyle(
                        fontSize: 1.5 * SizeConfig.textMultiplier,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  )),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              elevation: 5.0,
              onPressed: () => submitForm(context),
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
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterScreen())),
            child: Text(
              "DON'T HAVE AN ACCOUNT YET?",
              style: TextStyle(
                  fontSize: 2 * SizeConfig.textMultiplier,
                  color: Color(0xFF408EC6),
                  fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
    );
  }
}
