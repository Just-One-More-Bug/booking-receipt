class ReceiptData {
  const ReceiptData({
    required this.recipientName,
    required this.subtitle,
    required this.dateLabel,
    required this.dateValue,
    required this.orderLabel,
    required this.orderValue,
    required this.productName,
    required this.productSku,
    required this.totalLabel,
    required this.totalAmount,
    required this.statusLabel,
  });

  final String recipientName;
  final String subtitle;
  final String dateLabel;
  final String dateValue;
  final String orderLabel;
  final String orderValue;
  final String productName;
  final String productSku;
  final String totalLabel;
  final String totalAmount;
  final String statusLabel;
}
