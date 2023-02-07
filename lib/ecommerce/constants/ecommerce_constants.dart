import 'package:gorouter_demo/ecommerce/models/category_model.dart';
import 'package:gorouter_demo/ecommerce/models/product_model.dart';

class EcommerceConstants {
  static List<CategoryModel> categories = <CategoryModel>[
    const CategoryModel(name: "Clothes"),
    const CategoryModel(name: "Food"),
  ];
  
  static List<ProductModel> products = <ProductModel>[
    const ProductModel(name: "Milk"),
    const ProductModel(name: "Rice"),
    const ProductModel(name: "Pasta"),
    const ProductModel(name: "Steak"),
    const ProductModel(name: "T-Shirt"),
    const ProductModel(name: "Jeans"),
    const ProductModel(name: "Shirt"),
    const ProductModel(name: "Skirt"),
  ];
}