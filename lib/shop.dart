import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sampleecommerce/category.dart';
import 'package:sampleecommerce/category_avatar.dart';
import 'package:sampleecommerce/product_card.dart';
import 'package:sampleecommerce/product_data.dart';

class CategoryItem {
  final String name;
  final String image;

  const CategoryItem({required this.name, required this.image});
}

const categories = [
  CategoryItem(name: "Beauty", image: "assets/images/categories/beauty.webp"),
  CategoryItem(name: "Women", image: "assets/images/categories/female.webp"),
  CategoryItem(name: "Home", image: "assets/images/categories/home.webp"),
  CategoryItem(name: "Kids", image: "assets/images/categories/kids.webp"),
  CategoryItem(name: "Men", image: "assets/images/categories/male.webp"),
  CategoryItem(name: "Shoes", image: "assets/images/categories/shoes.webp"),
];

const banners = [
  "assets/images/banners/sale.webp",
  "assets/images/banners/another_sale.webp",
  "assets/images/banners/discount.webp",
  "assets/images/banners/winterSale.webp",
];

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyShoooop"),
        backgroundColor: Colors.deepOrange,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(onPressed: (){},
          icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Heading

              SizedBox(
                height: 200,
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: banners.map((path) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        path,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 24),

              // 2. Horizontal Category List
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 20,
                  children: categories.map((cat) {
                    return CategoryAvatar(
                      image: cat.image,
                      name: cat.name,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Category()),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24),

// 3. Popular Products header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular Products",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See All →"),
                  ),
                ],
              ),
              const SizedBox(height: 8),

// 4. Product grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),

              const SizedBox(height: 24),

            ],
          ),
        ),
      ),
    );
  }
}