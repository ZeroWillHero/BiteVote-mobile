import 'package:bitevote/components/custom_text_form_field.dart';
import 'package:bitevote/components/order/order_food_card.dart';
import 'package:bitevote/components/spinner.dart';
import 'package:bitevote/controllers/auth_controller.dart';
import 'package:bitevote/controllers/customize_item_controller.dart';
import 'package:bitevote/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/gradient_btn.dart';

class OrderPage extends StatelessWidget {
  OrderPage({super.key});

  final TextEditingController controller = TextEditingController();
  final OrderController orderController = Get.put(OrderController());
  final AuthController authController = Get.put(AuthController());
  final CustomizeItemController customizeItemController =
      Get.put(CustomizeItemController());

  @override
  Widget build(BuildContext context) {
    final food = Get.arguments['food'];
    final customizations = Get.arguments['customizations'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          // Display order Details
          Obx(() => orderController.isLoading.value
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Spinner(),
                )
              : OrderFoodCard(
                  food: food,
                  customizations: customizations,
                )),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
                hintText: "Enter Dilivery Address : ", controller: controller),
          ),

          GradientBtn(
            text: "Place Order",
            onPressed: () {
              // Get.toNamed('/order');
              orderController.placeOrder(
                authController.user.value?.id ?? "",
                food.id,
                food.shopId,
                customizeItemController.customizeItems
                    .cast<Map<String, dynamic>>(),
                orderController.itemQunaity.value,
                controller.text,
                "cash on delivery",
                DateTime.now().toString(), // Assign today's date here
              );

              
            },
          ),
          // form to enter User details and quantity
        ],
      ),
    );
  }
}
