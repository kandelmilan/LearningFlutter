import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/controllers/product_controller.dart';
import 'package:hello_world/views/product_details_view.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(title: Text("Product Details")),

      body: Obx(() {
        if (controller.isLoading.value == true) {
          return Center(child: CircularProgressIndicator());
        } else {
          // return SingleChildScrollView(
          //   child: InkWell(
          //     onTap: () {
          //       Get.to(() => ProductDetailView(product: p));
          //     },
          //     child: Column(
          //       children: [
          //         ListView.builder(
          //           shrinkWrap: true,
          //           physics: NeverScrollableScrollPhysics(),
          //           itemCount: controller.products.value.data.length,
          //           itemBuilder: (context, index) {
          //             var p = controller.products.value.data[index];
          //             return ListTile(
          //               leading: CircleAvatar(
          //                 backgroundImage: NetworkImage("${p.image}"),
          //               ),
          //               title: Text("${p.title}"),
          //               subtitle: Text("Price: Rs ${p.price}"),
          //             );
          //           },
          //         ),
          //       ],
          //     ),
          //   ),
          // );

          return ListView.builder(
            itemCount: controller.products.value.data.length,
            itemBuilder: (context, index) {
              var p = controller.products.value.data[index];

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
    );
  }
}
