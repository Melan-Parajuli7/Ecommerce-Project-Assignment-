// this is a model class for the Products shown in the (Popular Section)

class Products {
  final String name;
  final String catrgory;
  final String image;
  final double price;
  final double rating;
  final String discription;
  final String? badge;  // eg : 20% / "New" etc

const Products(
  {
    required this.name,
    required this.catrgory,
    required this.image,
    required this.price,
    required this.rating,
    required this.discription,
    required this.badge

  });
}