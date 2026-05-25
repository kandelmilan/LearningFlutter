import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/controllers/category_controller.dart';
import 'package:hello_world/controllers/product_controller.dart';
import 'package:hello_world/views/product_details_view.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var categoryController = Get.put(CategoryController());
    var productController = Get.put(ProductController());

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(title: Text("Product Details")),

      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text("Categories"),
              subtitle: Text("Choose your Favorite category"),
            ),

            /// CATEGORY LIST
            Obx(() {
              if (categoryController.isLoading.value) {
                return LinearProgressIndicator();
              } else {
                return SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryController.category.value.data.length,

                    itemBuilder: (context, index) {
                      var category =
                          categoryController.category.value.data[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Chip(label: Text("${category.title}")),
                      );
                    },
                  ),
                );
              }
            }),

            SizedBox(height: 10),
            ListTile(
              title: Text("Product"),
              subtitle: Text("Choose your Favorite product"),
            ),
            SizedBox(height: 10),

            /// PRODUCT LIST
            Obx(() {
              if (productController.isLoading.value) {
                return LinearProgressIndicator();
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                  itemCount: productController.products.value.data.length,

                  itemBuilder: (context, index) {
                    var p = productController.products.value.data[index];

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage("${p.image}"),
                      ),

                      title: Text("${p.title}"),

                      subtitle: Text("Price: Rs ${p.price}"),

                      onTap: () {
                        Get.to(() => ProductDetailView(product: p));
                      },
                    );
                  },
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
