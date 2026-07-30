import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:booking_receipt/src/app.dart';

void main() {
  testWidgets('renders receipt screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: BookingReceiptApp()));

    expect(find.text('Receipt'), findsOneWidget);
    expect(find.text('View timeline'), findsOneWidget);
    expect(find.text('Thank you Chloe'), findsOneWidget);
  });
}
