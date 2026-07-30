import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/booking_item.dart';

final bookingsProvider = Provider<List<BookingItem>>((ref) {
  const iconTypes = [
    BookingIconType.watch,
    BookingIconType.laptop,
    BookingIconType.console,
    BookingIconType.headset,
    BookingIconType.phone,
    BookingIconType.tablet,
    BookingIconType.camera,
    BookingIconType.speaker,
  ];
  const statuses = [
    BookingStatus.paid,
    BookingStatus.pending,
    BookingStatus.cancelled,
    BookingStatus.expired,
  ];
  const productNames = [
    'Apple Watch Pro',
    'MacBook Pro Max',
    'Sony Alpha Camera',
    'Bang & Olufsen Headphones',
    'iPhone 16 Pro',
    'iPad Pro M4',
    'PlayStation 5 Deluxe',
    'Bose Ultra Speaker',
    'Rolex Apple Watch Edition',
    'Razer Blade Studio',
    'Leica Q3 Luxe',
    'Marshall Monitor III',
  ];

  return List.generate(
    120,
    (index) {
      final bookingNumber = index + 1;
      return BookingItem(
        id: '#B${bookingNumber.toString().padLeft(4, '0')}',
        guestName: productNames[index % productNames.length],
        dateLabel: 'Jul ${10 + (bookingNumber % 20)}, 2026',
        amountLabel: '\$${(42 + (bookingNumber % 18) * 7).toStringAsFixed(2)}',
        status: statuses[index % statuses.length],
        iconType: iconTypes[index % iconTypes.length],
      );
    },
  );
});
