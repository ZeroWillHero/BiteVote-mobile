import 'package:bitevote/controllers/customize_item_controller.dart';
import 'package:bitevote/controllers/filter_btn_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomizeCard extends StatelessWidget {
  CustomizeCard({
    super.key,
    required this.filterBtnController,
    required this.index,
  });

  final FilterBtnController filterBtnController;
  final CustomizeItemController customizeItemController =
      Get.put(CustomizeItemController());
  final int index;

  final value = false.obs;
  final customizeItem = [].obs;

  void _handleCheckboxChanged(bool? newValue, int index) {
    value.value = newValue!;
    if (value.value) {
      customizeItemController.addItem({
        "name": filterBtnController.filteredFoods[index].customizations[0].name,
        "price": filterBtnController.filteredFoods[index].customizations[0].price,
      });
    } else {
      customizeItemController.removeItem(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Obx(() => Checkbox(
                      value: value.value,
                      activeColor: Colors.orange,
                      onChanged: (bool? newValue) {
                        _handleCheckboxChanged(newValue, index);
                      })),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      filterBtnController
                          .filteredFoods[index].customizations[0].name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "LKR ${filterBtnController.filteredFoods[index].customizations[0].price.toString()}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(filterBtnController
                    .filteredFoods[index].customizations[0].description),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
