import 'package:get/get.dart';
import 'package:hello_world/models/category_model.dart';
import 'package:hello_world/models/product_by_category_model.dart';
import 'package:hello_world/services/category_service.dart';

class CategoryController extends GetxController {
  var category = CategoriesModel(success: false, data: []).obs;
  var products = ProductByCategoryModel(success: false, category: null).obs;
  var isLoading = false.obs;

  Future fetchCategory() async {
    try {
      isLoading(true);

      var response = await CategoryService.getCategories();

      if (response != null) {
        category.value = CategoriesModel.fromJson(response.data);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future getProductByCategory(int id) async {
    try {
      var response = await ProductByCategoryService.getProductByCategory(id);
      if (response != null) {
        products.value = ProductByCategoryModel.fromJson(response.data);
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
    fetchCategory();
  }
}
