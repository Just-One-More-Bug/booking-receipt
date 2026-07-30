import 'package:flutter/material.dart';

class ReceiptPrinter extends StatelessWidget {
  const ReceiptPrinter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 368,
      height: 168,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 18,
            left: 20,
            right: 20,
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFB9B9B9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x35000000),
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -8,
            left: 48,
            right: 48,
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 34,
            left: 0,
            right: 0,
            child: Container(
              height: 58,
              decoration: BoxDecoration(
                color: const Color(0xFFB9B9B9),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF8E8E8E), width: 1.2),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 34,
            right: 34,
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Container(
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(0xFF161616),
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 45,
            right: 24,
            child: Container(
              width: 11,
              height: 11,
              decoration: BoxDecoration(
                color: const Color(0xFF15C94F),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF3B5A40),
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
