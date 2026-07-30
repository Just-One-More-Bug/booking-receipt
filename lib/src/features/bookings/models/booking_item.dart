class BookingItem {
  const BookingItem({
    required this.id,
    required this.guestName,
    required this.dateLabel,
    required this.amountLabel,
    required this.status,
    required this.iconType,
  });

  final String id;
  final String guestName;
  final String dateLabel;
  final String amountLabel;
  final BookingStatus status;
  final BookingIconType iconType;
}

enum BookingIconType {
  watch,
  laptop,
  console,
  headset,
  phone,
  tablet,
  camera,
  speaker,
}

enum BookingStatus {
  paid,
  pending,
  cancelled,
  expired,
}
