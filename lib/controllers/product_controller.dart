import 'package:get/get.dart';
import 'package:hello_world/models/feature_product.dart';
import 'package:hello_world/models/product_by_category_model.dart';
import 'package:hello_world/models/product_model.dart';
import 'package:hello_world/services/category_service.dart';
import 'package:hello_world/services/product_service.dart';

class ProductController extends GetxController {
  var products = ProductModel(success: false, data: []).obs;
  var category = ProductByCategoryModel(success: false, category: null).obs;
  var featuredProducts = FeaturedModel(success: false, data: []).obs;
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

  Future fetchProduct(int id) async {
    try {
      isLoading(true);
      var response = await ProductByCategoryService.getProductByCategory(id);
      if (response != null) {
        category.value = ProductByCategoryModel.fromJson(response.data);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  //get Featured Products
  Future getFeaturedProducts() async {
    try {
      isLoading(true);
      var response = await ProductService.getFeaturedProducts();

      if (response != null) {
        featuredProducts.value = FeaturedModel.fromJson(response.data);
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    getFeaturedProducts();
  }
}
