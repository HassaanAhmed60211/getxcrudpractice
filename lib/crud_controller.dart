import 'package:get/get.dart';

class CrudController extends GetxController {
  List<String> textData = [];

  addItem(String value) {
    textData.add(value);
    update();
  }

  deleteItem(index) {
    textData.removeAt(index);
    update();
  }
}
