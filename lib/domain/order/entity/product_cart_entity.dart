class ProductCartEntity {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String productSize;
  final String productColor;

  ProductCartEntity({
    required this.productSize,
    required this.productColor,
    required this.productId,
    required this.productTitle,
    required this.productQuantity,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
  });
}
