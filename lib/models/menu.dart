class Menu {
  final int id;
  final double price;
  final String name;
  final int storeId;
  final String imageUrl;
  final bool available;

  Menu({
    required this.id,
    required this.price,
    required this.name,
    required this.storeId,
    required this.imageUrl,
    required this.available,
  });
}