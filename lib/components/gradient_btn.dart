import 'package:bitevote/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradientBtn extends StatelessWidget {
  final String text;
  final GlobalKey<FormState>? form_key;
  final VoidCallback onPressed;
  GradientBtn(
      {super.key,
      required this.text,
      this.form_key,
      required this.onPressed});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFB7349), Color(0xFFFDA818)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: onPressed,
            child: Obx(() => authController.isloading.value
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(text, style: TextStyle(fontSize: 20))),
          ),
        ));
  }
}
