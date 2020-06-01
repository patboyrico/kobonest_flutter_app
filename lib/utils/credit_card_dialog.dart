import 'package:credit_card_field/credit_card_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_repo/utils/size_config.dart';

class CreditCardDialog extends StatefulWidget {
  @override
  _CreditCardDialogState createState() => _CreditCardDialogState();
}

class _CreditCardDialogState extends State<CreditCardDialog> {

  TextEditingController creditCardController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController expirationController = TextEditingController();
  TextEditingController pinController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: Consts.avatarRadius + Consts.padding,
              bottom: Consts.padding,
              left: Consts.padding,
              right: Consts.padding,
            ),
            margin: EdgeInsets.only(top: Consts.avatarRadius),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(Consts.padding),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: CreditCardFormField(
                     controller: creditCardController ,
                      decoration: InputDecoration(
                          labelText: 'Card Number',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 2.1 * SizeConfig.textMultiplier,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple))),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: ExpirationFormField(
                      decoration: InputDecoration(
                          labelText: 'Expiry Date',
                          hintText: "MM/YY",
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 2.1 * SizeConfig.textMultiplier,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple))),
                      controller: expirationController,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: CVVFormField(
                      
                       controller: cvvController ,
                      decoration: InputDecoration(
                          labelText: 'CVV',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 2.1 * SizeConfig.textMultiplier,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple))),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    child: TextField(
                      maxLength: 4,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                       controller: pinController,
                      decoration: InputDecoration(
                          counterText: "",
                          labelText: 'Card Pin',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 2.1 * SizeConfig.textMultiplier,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple))),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(
                      elevation: 5.0,
                      onPressed: () => print('object'),
                      padding: EdgeInsets.all(15.0),
                      color: Colors.purple,
                      child: Text(
                        'Save Now',
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
            ),
          ),
          Positioned(
            left: Consts.padding,
            right: Consts.padding,
            child: CircleAvatar(
              backgroundColor: Colors.purple,
              radius: Consts.avatarRadius,
              child: Icon(
                Icons.credit_card,
                color: Colors.white,
                size: 10 * SizeConfig.textMultiplier,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 46.0;
}
