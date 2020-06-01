import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_repo/blocs/auth_bloc/bloc/auth_bloc.dart';
import 'package:flutter_repo/blocs/auth_bloc/state/auth_state.dart';
import 'package:flutter_repo/blocs/bloc.dart';
import 'package:flutter_repo/data/auth_repository.dart';
import 'package:flutter_repo/screens/dashboard/dashboard.dart';
import 'package:flutter_repo/utils/custom_dialog.dart';
import 'package:flutter_repo/utils/loading_indicator.dart';
import 'package:flutter_repo/utils/painter.dart';
import 'package:flutter_repo/utils/size_config.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(Auth()), child: RegisterForm(),
        ),
    );
  }
}


class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
            if (state is RegisterCompletedState) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()));
            } else if (state is RegisterFailedState) {
              // Scaffold.of(context)
              //     .showSnackBar(SnackBar(content: Text(state.message)));

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
                return mainRegisterForm();
              } else if (state is InitializeLoginState) {
                return loadingIndicator();
              } else if (state is LoginFailedState) {
                return mainRegisterForm();
              } else {
                return mainRegisterForm();
              }
            }
            ),
          ));
  }
}


Widget mainRegisterForm() {
    return  Container(
        child: Column(
          children: <Widget>[TopBar(), InitialForm()],
        ),
      );
}



class TopBar extends StatelessWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvePainter(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
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

class InitialForm extends StatefulWidget {
  const InitialForm({Key key}) : super(key: key);

  @override
  _InitialFormState createState() => _InitialFormState();
}

class _InitialFormState extends State<InitialForm> {

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  void submitRegisterForm(BuildContext context) {
    final data = {
      'first_name': _firstNameController.text,
      'last_name': _lastNameController.text,
      'phone_number': _phoneNumberController.text,
      'email': _emailController.text,
      'password': _confirmPasswordController.text,
      'password_confirmation': _passwordController.text,
    };

    final authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(DoRegister(data));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: Text(
                  "Sign Up Now!",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 3.5 * SizeConfig.textMultiplier),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Container(
                  width: (MediaQuery.of(context).size.width - 40) / 2,
                  child: TextField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'FIRST NAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 1.5 * SizeConfig.textMultiplier,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple))),
                  ),
                ),
                SizedBox(width: 10.0),
                 Container(
                    width:(MediaQuery.of(context).size.width - 40) / 2,
                   child: TextField(
                     controller: _lastNameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'LAST NAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 1.5 * SizeConfig.textMultiplier,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple))),
                ),
                 ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          TextField(
            controller: _phoneNumberController,
            decoration: InputDecoration(
                labelText: 'PHONE NUMBER ',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 1.5 * SizeConfig.textMultiplier,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple))),
          ),
          SizedBox(height: 10.0),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: 'EMAIL ',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 1.5 * SizeConfig.textMultiplier,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple))),
            obscureText: true,
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
          SizedBox(height: 10.0),
          TextField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
                labelText: 'CONFIRM PASSWORD ',
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
              onPressed: () => submitRegisterForm(context),
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
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
