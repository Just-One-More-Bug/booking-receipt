import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/receipt_data.dart';

final receiptProvider = Provider<ReceiptData>((ref) {
  return const ReceiptData(
    recipientName: 'Chloe',
    subtitle: 'Your payment has been received\nsuccessfully',
    dateLabel: 'Date',
    dateValue: 'Oct 23, 2025',
    orderLabel: 'Order',
    orderValue: '#98732',
    productName: 'Apple Watch S5 GPS 40MM',
    productSku: 'MWV2LL/A',
    totalLabel: 'Total',
    totalAmount: '\$670.60',
    statusLabel: 'Paid',
  );
});
