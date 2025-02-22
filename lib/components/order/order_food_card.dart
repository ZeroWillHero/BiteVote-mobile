import 'package:bitevote/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderFoodCard extends StatelessWidget {
  final food;
  final customizations;
  OrderFoodCard({
    super.key,
    this.food,
    this.customizations,
  });

  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40), // Add space for the image
                Text(
                  food.name.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            // Decrease quantity functionality
                            orderController
                                .decrementQuantity(food.defaultprice);
                          },
                        ),
                        Obx(() => Text(
                              orderController.itemQunaity.value
                                  .toString(), // Replace with actual quantity from GetX controller
                              style: TextStyle(fontSize: 18),
                            )),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            // Increase quantity functionality
                            orderController
                                .incrementQuantity(food.defaultprice);
                          },
                        ),
                      ],
                    ),
                    Text(
                      'LKR ${food.defaultprice.toString()}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Customizations:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: customizations.map<Widget>((customization) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            customization['name'],
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Price: ${customization['price']}',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    );
                  }).toList(),
                ),

                SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    Text(
                      'Total Price : ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Obx(() => Text(
                          "LKR ${orderController.totalPrice.value}",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              food.images[0], // Replace with actual image URL from food object
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
