import 'package:chatdemoapp/src/common/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///show snackbar
void showSnackbar(
        {String? title,
        String? message,
        Color? bgColor,
        IconData? leadingIcon}) =>
    Get.showSnackbar(
      GetBar(
        onTap: (value) {
          Get.back();
        },
        duration: 3.seconds,
        title: title ?? "Notice",
        message: message,
        animationDuration: const Duration(milliseconds: 600),
        isDismissible: true,
        shouldIconPulse: false,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        icon: Icon(
          leadingIcon ?? Icons.info_outline,
          color: kWhiteColor,
        ),
        backgroundColor: bgColor ?? kPrimaryColor,
      ),
    );
