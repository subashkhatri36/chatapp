import 'package:flutter/material.dart';

class HeightWidget extends StatelessWidget {
  const HeightWidget(
    this.h, {
    Key? key,
  }) : super(key: key);
  final double h;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * h,
    );
  }
}

class WidthWidget extends StatelessWidget {
  const WidthWidget(
    this.w, {
    Key? key,
  }) : super(key: key);
  final double w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * w,
    );
  }
}
