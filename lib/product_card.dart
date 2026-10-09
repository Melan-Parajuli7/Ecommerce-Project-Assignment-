import 'package:flutter/material.dart';
import 'package:sampleecommerce/models/products.dart';
import 'package:sampleecommerce/product_details.dart';

class ProductCard extends StatelessWidget {
  final Products product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image area with Stack on top
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image, size: 40, color: Colors.grey),
                  ),
                ),
                if (product.badge != null)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        product.badge!,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                ),
              ],
            ),
          ),

          // Name and price
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  "Rs ${product.price.toStringAsFixed(0)}",
                  style: const TextStyle(
                      color: Colors.deepOrange, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // Button
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailsPage(product: product),
                    ),
                  );
                },
                child: const Text("View Details"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
