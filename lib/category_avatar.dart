import 'package:flutter/material.dart';

class CategoryAvatar extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback onTap;

  const CategoryAvatar({
    super.key,
    required this.image,
    required this.name,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      customBorder:  CircleBorder(),
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(height: 6),
          Text(name , style: TextStyle(fontSize: 12)
          ),
        ],
      ),
    );
  }
}
