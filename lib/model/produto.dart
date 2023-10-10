class Produto{
  String name;
  double price;
  String description;
  double rating;

  String get getName => name;
  set Name(String name) => this.name = name;

  double get getPrice => price;
  set setprice(double price) => this.price = price;

  String get getDescription => description;
  set Description(String description) => this.description = description;
  
  double get getRating => rating;
  set Rating(double rating) => this.rating = rating;

  Produto({required this.name, required this.price, required this.description, required this.rating});
}