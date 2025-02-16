import 'package:flutter/material.dart';

class LoginBg extends StatelessWidget {
  const LoginBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/bg1.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Image.asset(
            'assets/bg2.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(child: Container(color: Colors.black))
      ],
    );
  }
}
