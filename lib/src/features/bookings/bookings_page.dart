import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bookings/bookings_providers.dart';
import '../bookings/models/booking_item.dart';

class BookingsPage extends ConsumerWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookings = ref.watch(bookingsProvider);

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF5F5F5), Color(0xFFEAEAEA)],
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: _Header(),
              ),
              const SizedBox(height: 4),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
                  itemCount: bookings.length,
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFD1D1D1),
                  ),
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    return _BookingTile(
                      booking: booking,
                      onTap: () => Navigator.of(context).pushNamed('/receipt'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _CircleIcon(
          icon: Icons.arrow_back_ios_new_rounded,
          iconSize: 16,
          backgroundColor: Color(0xFFC8C8C8),
          borderColor: Color(0xFF8E8E8E),
          iconColor: Color(0xFF4F4F4F),
        ),
        const Text(
          'Recepits',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Color(0xFF181818),
            height: 1,
          ),
        ),
        const SizedBox(width: 38, height: 38),
      ],
    );
  }
}

class _CircleIcon extends StatelessWidget {
  const _CircleIcon({
    required this.icon,
    required this.iconSize,
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
  });

  final IconData icon;
  final double iconSize;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(color: borderColor),
      ),
      child: Icon(icon, size: iconSize, color: iconColor),
    );
  }
}

class _BookingTile extends StatelessWidget {
  const _BookingTile({
    required this.booking,
    required this.onTap,
  });

  final BookingItem booking;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF8E8E8E)),
              ),
              child: Center(
                child: Icon(
                  switch (booking.iconType) {
                    BookingIconType.watch => Icons.watch_outlined,
                    BookingIconType.laptop => Icons.laptop_mac_outlined,
                    BookingIconType.console => Icons.sports_esports_outlined,
                    BookingIconType.headset => Icons.headphones_outlined,
                    BookingIconType.phone => Icons.smartphone_outlined,
                    BookingIconType.tablet => Icons.tablet_mac_outlined,
                    BookingIconType.camera => Icons.photo_camera_outlined,
                    BookingIconType.speaker => Icons.speaker_outlined,
                  },
                  size: 18,
                  color: const Color(0xFF8E8E8E),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    booking.guestName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF202020),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    booking.dateLabel,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF7C7C7C),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  booking.amountLabel,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF181818),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  switch (booking.status) {
                    BookingStatus.paid => 'Paid',
                    BookingStatus.pending => 'Pending',
                    BookingStatus.cancelled => 'Cancelled',
                    BookingStatus.expired => 'Expired',
                  },
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: switch (booking.status) {
                      BookingStatus.paid => const Color(0xFF1BAE54),
                      BookingStatus.pending => const Color(0xFF9A7B00),
                      BookingStatus.cancelled => const Color(0xFFC53B3B),
                      BookingStatus.expired => const Color(0xFF6F6F6F),
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
