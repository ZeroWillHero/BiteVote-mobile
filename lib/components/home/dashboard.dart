import 'package:bitevote/components/Foods/FoodLayout.dart';
import 'package:bitevote/components/filter_btn.dart';
import 'package:bitevote/components/home/dashboard_item.dart';
import 'package:bitevote/controllers/filter_btn_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../custom_app_bar.dart';

class Dashboard extends StatelessWidget {
  Dashboard({
    super.key,
    required this.buttonLabels,
  });

  final List<String> buttonLabels;

  final FilterBtnController filterBtnController =
      Get.put(FilterBtnController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Vote Your Favourite Foods",
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: buttonLabels.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: FilterBtn(
                    label: buttonLabels[index],
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        Obx(() {
          if (filterBtnController.selectedFilter.value != "") {
            return Foodlayout();
          } else {
            return DashboardItem(
              buttonLabels: buttonLabels,
            );
          }
        })
      ],
    );
  }
}
