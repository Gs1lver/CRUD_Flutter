enum Type{
  pao,
  doce,
  salgado,
  bebida,
  outro
}

class Produto{
  String name;
  double price;
  bool isAvailable;
  List<Type> types;

  String get getName => name;
  set Name(String name) => this.name = name;

  double get getPrice => price;
  set setprice(double price) => this.price = price;
  
  bool get getIsAvailable => isAvailable;
  set setisAvailable(bool isAvailable) => this.isAvailable = isAvailable;

  bool hasType(Type type) {
    return types.contains(type);
  }

  void toggleType(Type type) {
    if (hasType(type) == true) {
      types.add(type);
    }else{
      types.remove(type);
    }
  }

  Produto({required this.name, required this.price, required this.isAvailable, required this.types});
}