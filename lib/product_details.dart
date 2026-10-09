import 'package:flutter/material.dart';
import './models/products.dart';

class ProductDetailsPage extends StatelessWidget {
  final Products product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                product.image,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 250,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image, size: 60),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                Text(" ${product.rating}"),
                const Spacer(),
                Text(
                  "Rs ${product.price.toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Chip(label: Text(product.catrgory)),
            const SizedBox(height: 12),
            const Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(product.discription),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${product.name} added to cart")),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}