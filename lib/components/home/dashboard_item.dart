import 'package:bitevote/components/home/hero_card.dart';
import 'package:bitevote/components/home/order_card.dart';
import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';

class DashboardItem extends StatelessWidget {
  const DashboardItem({
    super.key,
    required this.buttonLabels,
  });

  final List<String> buttonLabels;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     // hero cards section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dummyHeroCards.length,
              itemBuilder: (context, index) {
                final item = dummyHeroCards[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: HeroCard(
                    title: item['title'],
                    imagePath: item['imagePath'] as String,
                    description: item['description'],
                    buttonText: item['buttonText'],
                    onPressed: () {
                      // Define the action to be performed on button press
                    },
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        // orders section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "My Orders",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dummyOrders.length,
              itemBuilder: (context, index) {
                final item = dummyOrders[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: OrderCard(
                    imagePath: item['imagePath'],
                    item: item['item'],
                    quantity: item['quantity'],
                    totalPrice: item['totalPrice'],
                    orderStatus: item['orderStatus'],
                    onConfirm: () {
                      // Define the action to be performed on confirm
                    },
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}