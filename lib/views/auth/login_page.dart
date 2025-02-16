import 'package:bitevote/components/custom_text_form_field.dart';
import 'package:bitevote/components/gradient_btn.dart';
import 'package:bitevote/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // LoginBg(),
              Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.2,
                      ),
                      Center(
                        child: Image.asset('assets/logod.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextFormField(
                          hintText: "E mail",
                          controller: emailController,
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextFormField(
                          hintText: "Password",
                          controller: passwordController,
                          obscureText: true,
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.02,
                      ),
                      GradientBtn(
                        text: "Log In",
                        form_key: formKey,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            authController.login(
                                emailController.text, passwordController.text);
                          }
                        },
                      ),
                      SizedBox(height: constraints.maxHeight * 0.03),
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
                                Get.toNamed('/register');
                              },
                              child: Text(
                                "Sign Up",
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
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
