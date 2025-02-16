import 'package:bitevote/components/custom_text_form_field.dart';
import 'package:bitevote/components/gradient_btn.dart';
import 'package:bitevote/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nicController = TextEditingController();

  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Form(
              key: formKey,
              child: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.all(screenSize.width * 0.05),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset('assets/logod.png',
                          width: screenSize.width * 0.5),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenSize.width * 0.02),
                      child: CustomTextFormField(
                        hintText: "First name",
                        controller: firstnameController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenSize.width * 0.02),
                      child: CustomTextFormField(
                        hintText: "Last name",
                        controller: lastnameController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenSize.width * 0.02),
                      child: CustomTextFormField(
                        hintText: "E-mail",
                        controller: emailController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenSize.width * 0.02),
                      child: CustomTextFormField(
                        hintText: "Student Id",
                        controller: nicController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenSize.width * 0.02),
                      child: CustomTextFormField(
                        hintText: "Phone",
                        controller: phoneController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenSize.width * 0.02),
                      child: CustomTextFormField(
                        hintText: "Address",
                        controller: addressController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenSize.width * 0.02),
                      child: CustomTextFormField(
                        hintText: "Password",
                        obscureText: true,
                        controller: passwordController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenSize.width * 0.02),
                      child: CustomTextFormField(
                        hintText: "Confirm-password",
                        obscureText: true,
                        controller: confirmPasswordController,
                      ),
                    ),
                    SizedBox(height: screenSize.width * 0.1),
                    GradientBtn(
                        form_key: formKey,
                        text: "Register",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            authController.validate(
                                firstnameController.text,
                                lastnameController.text,
                                emailController.text,
                                passwordController.text,
                                nicController.text,
                                phoneController.text,
                                addressController.text);
                          }
                        }),
                    SizedBox(height: screenSize.width * 0.05),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account ?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/login');
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )))
        ],
      ),
    );
  }
}
