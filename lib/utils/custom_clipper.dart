import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 490.0);
    // path.quadraticBezierTo(size.width / 2, 380, size.width, 490.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}