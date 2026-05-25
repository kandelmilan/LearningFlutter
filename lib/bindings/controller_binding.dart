import 'package:get/get.dart';
import 'package:hello_world/controllers/category_controller.dart';
import 'package:hello_world/controllers/product_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController(), permanent: true);
    Get.put<CategoryController>(CategoryController(), permanent: true);
  }
}
