import 'package:flutter/material.dart';
import 'package:flutter_repo/models/active_savings.dart';
import 'package:flutter_repo/utils/size_config.dart';

Widget savingsCard(BuildContext context, ActiveSavings activeSavings, int index) {

  final List<Color> colors = [Colors.red, Colors.black12, Colors.blueGrey];

  return Container(
    width: 45 * SizeConfig.widthMultiplier,
    margin: EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 20.0,
    ),
    child: Stack(
      children: <Widget>[
      Container(
        height: 25 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0.0, 2.0),
              blurRadius: 1.0,
            ),
          ],
        ),
      ),
      Positioned(
        top: 20.0,
        left: 20.0,
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(30.0),
          color: colors[index],
          child: IconButton(
            icon: Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
            ), 
          onPressed: null
        ),),  
      ),
      Positioned(
        top: 90.0,
        left: 20.0,
        child: Text(
          '₦ ${activeSavings.amount}',
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.w700
          )
        )
      ),
      Positioned(
        top: 110.0,
        left: 20.0,
        child: Text(
          activeSavings.name,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 14.0
          )
        )
      )
    ]
  ),
  );
}
