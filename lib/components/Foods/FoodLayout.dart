import 'package:bitevote/components/Foods/FoodCard.dart';
import 'package:bitevote/controllers/filter_btn_controller.dart';
import 'package:bitevote/controllers/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Foodlayout extends StatelessWidget {
  Foodlayout({super.key});

  final FoodController foodController = Get.put(FoodController());
  final FilterBtnController filterBtnController =
      Get.put(FilterBtnController());

      

  @override
  Widget build(BuildContext context) {
    foodController.getFoods();
    filterBtnController.filterFoods();
    return Expanded(
      // ✅ This allows ListView to take available space
      child: Obx(() => ListView.builder(
            itemCount: filterBtnController.filteredFoods.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              if (foodController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                );
              } else {
                return FoodCard(
                  index: index,
                  imageUrl: filterBtnController.filteredFoods[index].images[0],
                  foodName: filterBtnController.filteredFoods[index].name,
                  description:
                      filterBtnController.filteredFoods[index].description,
                  price: filterBtnController.filteredFoods[index].defaultprice
                      .toDouble(),
                );
              }
            },
          )),
    );
  }
}
