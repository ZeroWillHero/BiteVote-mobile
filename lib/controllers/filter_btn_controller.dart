import 'package:bitevote/controllers/food_controller.dart';
import 'package:get/get.dart';

class FilterBtnController extends GetxController {
  final selectedFilter = "".obs;
  final isLoading = false.obs;
  final filteredFoods = [].obs;
  

  FoodController foodController = Get.put(FoodController());

  void filterFoods() {
    isLoading.value = true;
    if (selectedFilter.value == "All") {
      filteredFoods.value = foodController.foods;
      isLoading.value = false;
      return;
    } else {
      filteredFoods.value = foodController.foods
          .where((food) => food.meal == selectedFilter.value)
          .toList();
      isLoading.value = false;
    }

    print("Filtered Foods: $filteredFoods");
  }

  void selectFilter(String filter) {
    selectedFilter.value = filter;
  }
}
