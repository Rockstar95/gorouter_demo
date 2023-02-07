import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_demo/ecommerce/constants/ecommerce_constants.dart';
import 'package:gorouter_demo/ecommerce/models/category_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: ListView.builder(
        itemCount: EcommerceConstants.categories.length,
        itemBuilder: (BuildContext context, int index) {
          CategoryModel categoryModel = EcommerceConstants.categories[index];

          return ListTile(
            onTap: () {
              // http://localhost:61153/#/categories/product_list/1234
              context.goNamed("category_product_list", params: {
                "category" : categoryModel.name,
              });
            },
            title: Text(categoryModel.name),
          );
        },
      ),
    );
  }
}
