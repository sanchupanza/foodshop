
List<Items> getData() {
  List<Items> list = [];
  list.add(Items('Pizza', 300,  false));
  list.add(Items('Sandwich', 100,  false));
  list.add(Items('Coffee', 50,  false));
  list.add(Items('Pasta', 150,  false));
  list.add(Items('Biryani', 250,  false));
  list.add(Items('Manchurian', 80,  false));
  return list;
}

class Items {
  String name;
  int price;
  bool isInCart;

  Items(this.name, this.price, this.isInCart);

  factory Items.fromJson(Map<String, dynamic> json) =>
      Items(json["name"], json["price"], json["isInCart"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "isInCart": isInCart
      };
}