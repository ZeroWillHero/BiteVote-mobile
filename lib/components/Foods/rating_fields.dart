import 'package:bitevote/controllers/rating_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingFields extends StatefulWidget {
  final foodId;
  final shopId;
  final userId;

  RatingFields({
    super.key,
    required this.foodId,
    required this.shopId,
    required this.userId,
  });

  final RatingController ratingController = Get.put(RatingController());

  @override
  _RatingFieldsState createState() => _RatingFieldsState();
}

class _RatingFieldsState extends State<RatingFields> {
  double shopRating = 70.0;
  double foodRating = 80.0;
  final TextEditingController shopRatingController = TextEditingController();
  final TextEditingController foodRatingController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final RatingController ratingController = Get.put(RatingController());

  @override
  void initState() {
    super.initState();
    shopRatingController.text = shopRating.toStringAsFixed(2);
    foodRatingController.text = foodRating.toStringAsFixed(2);
  }

  @override
  void dispose() {
    shopRatingController.dispose();
    foodRatingController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rate the Shop",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Slider(
            value: shopRating,
            min: 0,
            max: 100,
            divisions: 100,
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.blueAccent.withOpacity(0.3),
            onChanged: (double value) {
              setState(() {
                shopRating = value;
                shopRatingController.text = value.toStringAsFixed(2);
              });
            },
          ),
          TextField(
            controller: shopRatingController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Shop Rating',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Rate the Food",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Slider(
            value: foodRating,
            min: 0,
            max: 100,
            divisions: 100,
            activeColor: Colors.greenAccent,
            inactiveColor: Colors.greenAccent.withOpacity(0.3),
            onChanged: (double value) {
              setState(() {
                foodRating = value;
                foodRatingController.text = value.toString();
              });
            },
          ),
          TextField(
            controller: foodRatingController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Food Rating',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Message",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          TextField(
            controller: messageController,
            decoration: InputDecoration(
              labelText: 'Enter your message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                onPressed: () async {
                  await ratingController.rateFood(
                      foodRating,
                      widget.foodId,
                      messageController.text,
                      widget.userId);
                },
                child: Obx(
                  () => ratingController.isLoading.value
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text(
                          "Add your order",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
