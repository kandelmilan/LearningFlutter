import 'package:get/get.dart';
import 'package:hello_world/models/category_model.dart';
import 'package:hello_world/services/category_service.dart';

class CategoryController extends GetxController {
  var category = CategoriesModel(success: false, data: []).obs;
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

  @override
  void onInit() {
    super.onInit();
    fetchCategory();
  }
}
