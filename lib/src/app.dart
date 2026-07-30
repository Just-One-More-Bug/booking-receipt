import 'package:flutter/material.dart';

import 'features/bookings/bookings_page.dart';
import 'features/receipt/receipt_page.dart';

class BookingReceiptApp extends StatelessWidget {
  const BookingReceiptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Receipt',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF0F0F0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2B2B2B),
          brightness: Brightness.light,
        ),
      ),
      routes: {
        '/receipt': (_) => const ReceiptPage(),
      },
      home: const BookingsPage(),
    );
  }
}
