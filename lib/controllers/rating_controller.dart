import 'dart:convert';
import 'package:bitevote/components/snackBars/failed.dart';
import 'package:bitevote/components/snackBars/success.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RatingController extends GetxController {
  String foodpath = "foodReviews/create";
  String shoppath = "shopReviews/create";
  String baseUrl = "https://bite-vote-backend.vercel.app/api/";
  var isLoading = false.obs;

  Future<void> rateFood(
      double foodRating, String foodId, String message, String userId) async {
    try {
      // fetching to the food Review
      print("Add food Rate...!");
      final response = await http.post(Uri.parse("$baseUrl$foodpath"),
          headers: {
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            "rating": foodRating,
            "foodId": foodId,
            "message": message,
            "userId": userId
          }));

      if (response.statusCode == 201) {
        SuccessSnackBar.show("food Rate added Successfully");
      } else {
        FailedSnackBar.show("Failed to add food Rate");
      }
    } catch (e) {
      print("Error: $e");
      FailedSnackBar.show("An error occurred while adding food Rate");
    }
  }

  Future<void> rateShop(
      double shopRating, String shopId, String message, String userId) async {
    try {
      // fetching to the shop Review
      final response = await http.post(Uri.parse("$baseUrl$shoppath"),
          headers: {
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            "rating": shopRating,
            "shopId": shopId,
            "message": message,
            "userId": userId
          }));

      if (response.statusCode == 201) {
        SuccessSnackBar.show("Shop Rate added Successfully");
      } else {
        FailedSnackBar.show("Failed to add Shop Rate");
      }
    } catch (e) {
      print("Error: $e");
      FailedSnackBar.show("An error occurred while adding Shop Rate");
    }
  }
}
