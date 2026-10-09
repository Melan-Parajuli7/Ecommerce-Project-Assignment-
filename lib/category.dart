import 'package:flutter/material.dart';


class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Category')),
      body: SafeArea(child: Padding(padding: const  EdgeInsets.all(8.0),
      child: Column(
        children: [
            Text('This is a Category Screen'),
           SizedBox(height: 16),

        ],
      ),)

      ),
    );
  }
}
