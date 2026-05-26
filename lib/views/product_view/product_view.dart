import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/controllers/category_controller.dart';
import 'package:hello_world/controllers/product_controller.dart';
import 'package:hello_world/views/product_view/product_by_category_view.dart';
import 'package:hello_world/views/product_view/product_details_view.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController =
        Get.find<CategoryController>();
    final ProductController productController = Get.find<ProductController>();

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(title: const Text("Product Details")),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(
            bottom: 120,
          ), // Increased to prevent overflow
          child: Column(
            children: [
              // Featured Carousel
              Obx(() {
                if (productController.isLoading.value) {
                  return const LinearProgressIndicator();
                }

                final products = productController.featuredProducts.value.data;

                if (products.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("No featured products"),
                  );
                }

                return CarouselSlider(
                  options: CarouselOptions(
                    height: 180,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.85,
                  ),
                  items: products.map((i) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "${i.image}",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.broken_image),
                            );
                          },
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),

              const ListTile(
                title: Text("Categories"),
                subtitle: Text("Choose your Favorite category"),
              ),

              // Category List
              Obx(() {
                if (categoryController.isLoading.value) {
                  return const LinearProgressIndicator();
                }
                return SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: categoryController.category.value.data.length,
                    itemBuilder: (context, index) {
                      var category =
                          categoryController.category.value.data[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: GestureDetector(
                          onTap: () {
                            categoryController.getProductByCategory(
                              category.id!,
                            );
                            Get.to(() => const ProductByCategoryView());
                          },
                          child: Chip(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(
                                color: Colors.deepPurple,
                                width: 1.2,
                              ),
                            ),
                            label: Text(
                              "${category.title}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),

              const ListTile(
                title: Text("Product"),
                subtitle: Text("Choose your Favorite product"),
              ),

              // Product GridView
              Obx(() {
                if (productController.isLoading.value) {
                  return const LinearProgressIndicator();
                }

                final products = productController.products.value.data;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        0.75, // Adjusted for better height control
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    var p = products[index];

                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ProductDetailView(product: p));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.network(
                                "${p.image}",
                                height: 155,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(
                                  height: 155,
                                  color: Colors.grey[100],
                                  child: const Icon(Icons.broken_image),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${p.title}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Rs ${p.price}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),

              const SizedBox(
                height: 100,
              ), // Strong bottom space to fix RenderFlex overflow
            ],
          ),
        ),
      ),
    );
  }
}
