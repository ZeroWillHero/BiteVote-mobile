import 'package:bitevote/controllers/filter_btn_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBtn extends StatelessWidget {
  final String label;
  FilterBtn({super.key, required this.label});

  final FilterBtnController filterBtnController =
      Get.put(FilterBtnController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ElevatedButton(
        onPressed: () {
          filterBtnController.selectFilter(label);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          backgroundColor: filterBtnController.selectedFilter.value == label
              ? Colors.orange
              : Colors.grey,
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      );
    });
  }
}
