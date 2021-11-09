import 'package:chatdemoapp/src/common/constant/constants.dart';
import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  final double? fontSize;
  final bool isBold;
  final String text;
  final bool isCentered;
  final Color? color;

  const AppBarText(
    this.text, {
    Key? key,
    this.fontSize,
    this.isBold = false,
    this.isCentered = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline3!.copyWith(
            fontSize: fontSize != null ? fontSize! : null,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: color ?? kPrimaryColor,
          ),
      textAlign: isCentered ? TextAlign.center : null,
      overflow: TextOverflow.ellipsis,
    );
  }
}
