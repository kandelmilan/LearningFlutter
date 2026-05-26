import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hello_world/utils/app_size.dart';

class ProductDetailView extends StatelessWidget {
  final dynamic product;

  const ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title ?? "Detail")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(product.image ?? ""),
              SizedBox(height: 10),

              Text(
                product.title ?? "",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),
              Text("Category: ${product.category}"),

              Row(
                children: [
                  Text(
                    "Rs ${product.price}",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(width: 10),

                  Text(
                    "Rs ${product.discountedPrice}",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  SizedBox(width: 10),

                  Text(
                    "(${product.discountPercent} OFF)",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Size"),
                  Row(
                    children: [
                      Chip(label: Text("36")),
                      Gap(AppSize.vGap),
                      Chip(label: Text("37")),
                      Gap(AppSize.vGap),
                      Chip(label: Text("38")),
                      Gap(AppSize.vGap),
                      Chip(label: Text("39")),
                    ],
                  ),
                  Gap(AppSize.hGap),
                  Text("Quantity"),
                  Gap(AppSize.hGap),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.remove, size: 20),

                        SizedBox(width: 15),

                        Text(
                          "1",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(width: 15),

                        Icon(Icons.add, size: 20),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(AppSize.hGap),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        onPressed: () {},
                        child: Text("Buy Now"),
                      ),
                    ),
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        onPressed: () {},
                        child: Text("Add to Cart"),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(AppSize.hGap),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Delivery Options",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Spacer(),

                        Icon(Icons.info_outline, color: Colors.grey, size: 20),
                      ],
                    ),

                    SizedBox(height: 15),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.orange),

                        SizedBox(width: 10),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bagmati, Kathmandu Metro 22 - Newroad Area",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),

                              SizedBox(height: 4),

                              Text(
                                "Newroad, Kathmandu",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
