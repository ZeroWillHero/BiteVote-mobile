import 'package:bitevote/components/home/dashboard.dart';
import 'package:flutter/material.dart';

class MainHome extends StatelessWidget {
  const MainHome({
    super.key,
    required this.buttonLabels,
  });

  final List<String> buttonLabels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Dashboard(
      buttonLabels: buttonLabels,
    ));
  }
}
