import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../models/category_model.dart';

class MockDataService {
  static List<ProductModel> getExclusiveOffers() {
    return [
      ProductModel(
        id: '1',
        name: 'Organic Bananas',
        description: '1kg, Price',
        imagePath: 'asstes/images/banana.png',
        price: 100,
        unit: '1kg',
      ),
      ProductModel(
        id: '2',
        name: 'Red Apple',
        description: '1kg, Price',
        imagePath: 'asstes/images/apple.png',
        price: 150,
        unit: '1kg',
        isPreOrder: true,
      ),
      ProductModel(
        id: '3',
        name: 'Ginger',
        description: '1kg, Price',
        imagePath: 'asstes/images/pineapple.png',
        price: 200,
        unit: '1kg',
      ),
    ];
  }

  static List<ProductModel> getBestSelling() {
    return [
      ProductModel(
        id: '4',
        name: 'Bell Pepper Red',
        description: '1kg, Price',
        imagePath: 'asstes/images/tomato.png',
        price: 150,
        unit: '1kg',
        isPreOrder: true,
      ),
      ProductModel(
        id: '5',
        name: 'Red Apple',
        description: '250gm, Price',
        imagePath: 'asstes/images/apple.png',
        price: 50,
        unit: '250gm',
      ),
      ProductModel(
        id: '5b',
        name: 'Organic Tomato',
        description: '1kg, Price',
        imagePath: 'asstes/images/tomato.png',
        price: 50,
        unit: '1kg',
      ),
    ];
  }

  static List<CategoryModel> getGroceries() {
    return [
      CategoryModel(
        id: '1',
        name: 'Pulses',
        imagePath: 'asstes/images/grocery.png',
        backgroundColor: const Color(0xFFF8E8D0),
      ),
      CategoryModel(
        id: '2',
        name: 'Rice',
        imagePath: 'asstes/images/rice.png',
        backgroundColor: const Color(0xFFE5F3EA),
      ),
    ];
  }

  static List<ProductModel> getMeatProducts() {
    return [
      ProductModel(
        id: '6',
        name: 'Beef Bone',
        description: '1kg, Price',
        imagePath: 'asstes/images/beef.png',
        price: 350,
        unit: '1kg',
        isPreOrder: true,
      ),
      ProductModel(
        id: '7',
        name: 'Broiler Chicken',
        description: '1kg, Price',
        imagePath: 'asstes/images/chicken.png',
        price: 125,
        unit: '1kg',
      ),
    ];
  }

  static List<CategoryModel> getExploreCategories() {
    return [
      CategoryModel(
        id: 'e1',
        name: 'Frash Fruits\n& Vegetable',
        imagePath: 'asstes/images/frash_fruits_vegetable.png',
        backgroundColor: const Color(0xFFEEF7F1),
      ),
      CategoryModel(
        id: 'e2',
        name: 'Cooking Oil\n& Ghee',
        imagePath: 'asstes/images/cooking_oil_ghee.png',
        backgroundColor: const Color(0xFFFDF5EC),
      ),
      CategoryModel(
        id: 'e3',
        name: 'Meat & Fish',
        imagePath: 'asstes/images/meat_fish.png',
        backgroundColor: const Color(0xFFFDE8E4),
      ),
      CategoryModel(
        id: 'e4',
        name: 'Bakery & Snacks',
        imagePath: 'asstes/images/bakery_snacks.png',
        backgroundColor: const Color(0xFFF4EBF7),
      ),
      CategoryModel(
        id: 'e5',
        name: 'Dairy & Eggs',
        imagePath: 'asstes/images/dairy_eggs.png',
        backgroundColor: const Color(0xFFFEF8E5),
      ),
      CategoryModel(
        id: 'e6',
        name: 'Beverages',
        imagePath: 'asstes/images/beverages.png',
        backgroundColor: const Color(0xFFEDF7FC),
      ),
    ];
  }

  static List<ProductModel> getBeverages() {
    return [
      ProductModel(
        id: 'b1',
        name: 'Diet Coke',
        description: '355ml, Price',
        imagePath: 'asstes/images/diet_coke.png',
        price: 1.99,
        unit: '355ml',
      ),
      ProductModel(
        id: 'b2',
        name: 'Sprite Can',
        description: '325ml, Price',
        imagePath: 'asstes/images/sprite_can.png',
        price: 1.50,
        unit: '325ml',
      ),
      ProductModel(
        id: 'b3',
        name: 'Apple & Grape Juice',
        description: '2L, Price',
        imagePath: 'asstes/images/tree-top-juice-apple-grape.png',
        price: 15.99,
        unit: '2L',
      ),
      ProductModel(
        id: 'b4',
        name: 'Orenge Juice',
        description: '2L, Price',
        imagePath: 'asstes/images/orenge_juice.png',
        price: 15.99,
        unit: '2L',
      ),
      ProductModel(
        id: 'b5',
        name: 'Coca Cola Can',
        description: '325ml, Price',
        imagePath: 'asstes/images/coca_cola_can.png',
        price: 4.99,
        unit: '325ml',
      ),
      ProductModel(
        id: 'b6',
        name: 'Pepsi Can',
        description: '330ml, Price',
        imagePath: 'asstes/images/pepsi_can.png',
        price: 4.99,
        unit: '330ml',
      ),
    ];
  }

  static List<ProductModel> getEggsAndMore() {
    return [
      ProductModel(
        id: 'eg1',
        name: 'Egg Chicken Red',
        description: '4pcs, Price',
        imagePath: 'asstes/images/egg _chicken_red.png',
        price: 1.99,
        unit: '4pcs',
      ),
      ProductModel(
        id: 'eg2',
        name: 'Egg Chicken White',
        description: '180g, Price',
        imagePath: 'asstes/images/egg_chicken_white.png',
        price: 1.50,
        unit: '180g',
      ),
      ProductModel(
        id: 'eg3',
        name: 'Egg Pasta',
        description: '30gm, Price',
        imagePath: 'asstes/images/egg_pasta .png',
        price: 15.99,
        unit: '30gm',
      ),
      ProductModel(
        id: 'eg4',
        name: 'Egg Noodles',
        description: '2L, Price',
        imagePath: 'asstes/images/egg_noodles.png',
        price: 15.99,
        unit: '2L',
      ),
      ProductModel(
        id: 'eg5',
        name: 'Mayonnais Eggless',
        description: '325ml, Price',
        imagePath: 'asstes/images/mayonnais_eggless.png',
        price: 4.99,
        unit: '325ml',
      ),
      ProductModel(
        id: 'eg6',
        name: 'Egg Noodles',
        description: '330ml, Price',
        imagePath: 'asstes/images/egg_eoodles.png',
        price: 4.99,
        unit: '330ml',
      ),
    ];
  }
}
