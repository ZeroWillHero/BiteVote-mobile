import 'package:bitevote/components/Foods/rating_fields.dart';
import 'package:bitevote/components/gradient_btn.dart';
import 'package:bitevote/controllers/auth_controller.dart';
import 'package:bitevote/controllers/customize_item_controller.dart';
import 'package:bitevote/controllers/filter_btn_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customize_card.dart';

class FoodDetailedCard extends StatelessWidget {
  final int index;
  FoodDetailedCard({super.key, required this.index});

  final FilterBtnController filterBtnController =
      Get.put(FilterBtnController());

  final AuthController _authController = Get.put(AuthController());
  final CustomizeItemController _customizeItemController =
      Get.put(CustomizeItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          child: Center(
              child: Text(filterBtnController.filteredFoods[index].name)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                filterBtnController.filteredFoods[index].images[0],
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // food name
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        filterBtnController.filteredFoods[index].name,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "⭐ ${filterBtnController.filteredFoods[index].avarageRating.toString()}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 30, 10),
                  child: Text(
                    "LKR ${filterBtnController.filteredFoods[index].defaultprice.toString()}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            // food description
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                filterBtnController.filteredFoods[index].description,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Customize your meal",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),

            // Customized Items
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filterBtnController
                  .filteredFoods[index].customizations.length,
              itemBuilder: (context, customizationIndex) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomizeCard(
                    filterBtnController: filterBtnController,
                    index: index,
                  ),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Rate your meal",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            RatingFields(
              foodId: filterBtnController.filteredFoods[index].id,
              userId: _authController.user.value!.id,
              shopId: filterBtnController.filteredFoods[index].shopId,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 40),
              child: Center(
                child: GradientBtn(
                    text: "Checkout",
                    onPressed: () {
                      Get.toNamed("/checkout", arguments: {
                        "food": filterBtnController.filteredFoods[index],
                        "customizations":
                            _customizeItemController.customizeItems
                      });
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
