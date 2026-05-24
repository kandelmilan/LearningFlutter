import 'package:get/get.dart';
import 'package:hello_world/models/product_model.dart';
import 'package:hello_world/services/product_service.dart';

class ProductController extends GetxController {
  var products = ProductModel(success: false, data: []).obs;
  var isLoading = false.obs;

  Future fetchProducts() async {
    try {
      isLoading(true);
      var response = await ProductService.getProducts();
      if (response != null) {
        products.value = ProductModel.fromJson(response.data);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }
}
