import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FailedSnackBar {
  static void show(String message) {
    Get.snackbar(
      'Failed',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      borderRadius: 10,
      margin: EdgeInsets.all(10),
      icon: Icon(Icons.check_circle, color: Colors.white),
      duration: Duration(seconds: 3),
    );
  }
}
