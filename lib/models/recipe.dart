class Recipe {
  final String name;
  final String image;
  final double rating;
  final String totalTime;
  final List<String> cookDetails;

  Recipe({
    required this.name,
    required this.image,
    required this.rating,
    required this.totalTime,
    required this.cookDetails,
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json['name'] as String,
      image: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String,
      cookDetails: json['cookDetails'] as List<String>,
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $image, rating: $rating, totalTime: $totalTime}';
  }
}
