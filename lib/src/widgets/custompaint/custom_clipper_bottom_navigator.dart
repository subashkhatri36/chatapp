import 'package:flutter/material.dart';

class ButtomNavClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 10);
    path.quadraticBezierTo(
        size.width / 2, size.height - 50, size.width, size.height - 10);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
}
