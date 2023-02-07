import 'package:flutter/material.dart';
import 'package:gorouter_demo/ecommerce/constants/ecommerce_constants.dart';
import 'package:gorouter_demo/ecommerce/models/category_model.dart';
import 'package:gorouter_demo/ecommerce/models/product_model.dart';

class ProductListScreen extends StatefulWidget {
  final String category;

  const ProductListScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: ListView.builder(
        itemCount: EcommerceConstants.products.length,
        itemBuilder: (BuildContext context, int index) {
          ProductModel productModel = EcommerceConstants.products[index];

          return ListTile(
            onTap: () {

            },
            title: Text(productModel.name),
          );
        },
      ),
    );
  }
}
