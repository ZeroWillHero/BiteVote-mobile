import 'package:bitevote/components/snackBars/failed.dart';
import 'package:bitevote/components/snackBars/success.dart';
import 'package:bitevote/controllers/customize_item_controller.dart';
import 'package:bitevote/controllers/food_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderController extends GetxController {
  var totalPrice = 0.0.obs;
  var itemQunaity = 1.obs;
  var isLoading = false.obs;

  final url = "https://bite-vote-backend.vercel.app/api/order/create";

  final FoodController foodController = Get.put(FoodController());

  final CustomizeItemController customizeItemController =
      Get.put(CustomizeItemController());

  void onInit() {
    super.onInit();
    itemQunaity.value = 1;
    calculateTotalPrice(
        foodController.foods[foodController.selectedItem.value].defaultprice);
  }

  void incrementQuantity(int foodPrice) {
    itemQunaity.value++;
    calculateTotalPrice(foodPrice);
  }

  void decrementQuantity(int foodPrice) {
    if (itemQunaity.value > 1) {
      itemQunaity.value--;
    }
    calculateTotalPrice(foodPrice);
  }

  void calculateTotalPrice(int foodPrice) {
    totalPrice.value =
        (foodPrice + customizeItemController.customizePrice.value) *
            itemQunaity.value;
  }

  Future<void> placeOrder(
      String userId,
      String foodId,
      String shopId,
      List<Map<String, dynamic>> customItems,
      int quantity,
      String deliveryAddress,
      String paymentMethod,
      String deliveryDate) async {
    print("Placing order with the following details:");
    print("User ID: $userId");
    print("Food ID: $foodId");
    print("Shop ID: $shopId");
    print("Custom Items: $customItems");
    print("Quantity: $quantity");
    print("Delivery Address: $deliveryAddress");
    print("Payment Method: $paymentMethod");
    print("Delivery Date: $deliveryDate");
    // order Foods API call
    try {
      isLoading.value = true;
      final http.Response response = await http.post(Uri.parse(url),
          body: jsonEncode({
            "userId": userId,
            "foodId": foodId.toString(),
            "shopId": shopId,
            "customItems": customItems
                .map((item) => {"item": item["item"], "price": item["price"]})
                .toList(),
            "quantity": quantity,
            "deliveryAddress": deliveryAddress,
            "paymentMethod": paymentMethod,
            "deliveryDate": deliveryDate
          }),
          headers: {
            "Content-Type": "application/json",
          });

      if (response.statusCode == 201) {
        SuccessSnackBar.show("Order placed successfully");
        isLoading.value = false;
      } else {
        FailedSnackBar.show(" ${jsonDecode(response.body)['message']}");
        print("Res Body" + response.body);
        isLoading.value = false;
      }
    } catch (e) {
      print("Error: $e");
      FailedSnackBar.show("Failed to place order");
      isLoading.value = false;
    }
  }
}
