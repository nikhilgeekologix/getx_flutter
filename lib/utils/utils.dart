import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.black);
  }

  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        gravity: ToastGravity.CENTER);
  }

  static snackBar(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: Colors.red,
        colorText: Colors.black,
        messageText: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.error));
  }

  static snackSuccessBar(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        messageText: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.check_circle));
  }
}
