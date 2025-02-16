import 'dart:convert';
import 'package:bitevote/models/food_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FoodController extends GetxController {
  final selectedItem = 0.obs;
  final isLoading = false.obs;
  final foods = <Food>[].obs;

  @override
  void onInit() {
    super.onInit();
    getFoods();
  }

  void selectItem(int index) {
    selectedItem.value = index;
  }

  

  final String url = "https://bite-vote-backend.vercel.app/api/foods/get";

  Future<void> getFoods() async {
    try {
      isLoading.value = true;
      final http.Response response = await http.get(Uri.parse(url));
      final responseData = jsonDecode(response.body);
      print("Response Data: $responseData");

      if (response.statusCode == 200) {
        final foodModel = FoodModel.fromJson(jsonDecode(response.body));
        foods.value = foodModel.foods;
      } else {
        throw Exception(responseData['error'] ?? 'Failed to fetch foods');
      }
      isLoading.value = false;
    } catch (e) {
      print("Error: $e");
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
