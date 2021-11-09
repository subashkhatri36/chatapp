import 'package:chatdemoapp/src/common/constant/constants.dart';
import 'package:flutter/material.dart';

/// custom outlined button widget
class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.borderColor = kPrimaryColor,
    this.textColor = kBlackColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding + 5),
      child: Container(
        constraints: const BoxConstraints(minHeight: 50),
        width: double.infinity,
        child: OutlinedButton(
          child: Text(
            label.trim(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            primary: textColor, // foreground
            side: BorderSide(color: borderColor), // disabled
          ),
        ),
      ),
    );
  }
}
