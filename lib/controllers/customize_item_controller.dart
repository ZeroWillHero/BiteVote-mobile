import 'package:get/get.dart';

class CustomizeItemController extends GetxController {
  var customizeItems = [].obs;

  void addItem(Map<String, dynamic> item) {
    customizeItems.add(item);
    print(customizeItems);
  }

  void removeItem(int index) {
    if (customizeItems.length != 1) {
      customizeItems.removeAt(index);
    } else {
      clearItems();
    }
    print(customizeItems);
  }

  void clearItems() {
    customizeItems.clear();
    customizeItems.refresh();
  }
}
