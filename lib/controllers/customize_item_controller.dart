import 'package:get/get.dart';

class CustomizeItemController extends GetxController {
  var customizeItems = [].obs;
  var customizePrice = 0.0.obs;

  void addItem(Map<String, dynamic> item) {
    customizeItems.add(item);
    customizePrice.value += item['price'];
    print(customizeItems);
    print(customizePrice);
  }

  void removeItem(int index) {
    if (customizeItems.length != 1) {
      customizePrice.value -= customizeItems[index]['price'];
      customizeItems.removeAt(index);
    } else {
      customizePrice.value = 0.0;

      clearItems();
    }

    // customizePrice.value -= customizeItems[index]['price'];

    print(customizeItems);
    print(customizePrice);
  }

  void clearItems() {
    customizeItems.clear();
    customizeItems.refresh();
    customizePrice.value = 0.0;
  }
}
