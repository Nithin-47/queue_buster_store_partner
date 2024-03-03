class CartItems {
  String name;
  String location;
  List<Item> items = [];

  CartItems({required this.name, required this.location, required this.items});
}

class Item {
  int? id;
  String? name;
  int? price;
  int? quantity;
  int? storeId;
  String? storeName;
  String? storeImageUrl;
  String? imageUrl;

  Item(
      {this.id,
      this.name,
      this.price,
      this.quantity,
      this.storeId,
      this.storeName,
        this.storeImageUrl,
      this.imageUrl});

  void setQuantity(int newVal) {
    quantity = newVal;
  }
}
