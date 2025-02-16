import 'package:bitevote/Theme/app_theme_data.dart';
import 'package:bitevote/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const BiteVote());
}

class BiteVote extends StatelessWidget {
  const BiteVote({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BiteVote',
      theme: appTheme,
      initialRoute: "/login",
      getPages: pages,
    );
  }
}
