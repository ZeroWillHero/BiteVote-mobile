import 'package:bitevote/components/bottom_nav_bar.dart';
import 'package:bitevote/components/home/main_home.dart';
import 'package:bitevote/controllers/bottom_nav_controller.dart';
import 'package:bitevote/controllers/filter_btn_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final List<String> buttonLabels = ["All", "breakfast", "lunch", "dinner"];
  HomePage({super.key});

  final FilterBtnController _filterBtnController =
      Get.put(FilterBtnController());

  final BottomNavController _bottomNavBar = Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (_bottomNavBar.selectedIndex.value) {
          case 0:
            return MainHome(buttonLabels: buttonLabels);
          case 1:
            return Center(
              child: Text(
                "orders",
                style: TextStyle(color: Colors.black),
              ),
            );
          case 2:
            return Center(
              child: Text(
                "profile",
                style: TextStyle(color: Colors.black),
              ),
            );
          case 3:
            return Center(
              child: Text(
                "settings",
                style: TextStyle(color: Colors.black),
              ),
            );
          default:
            return MainHome(buttonLabels: buttonLabels);
        }
      }),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
