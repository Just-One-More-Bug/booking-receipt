import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'receipt_providers.dart';
import '../../shared/widgets/receipt_printer.dart';
import '../../shared/widgets/receipt_sheet.dart';

class ReceiptPage extends ConsumerWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receipt = ref.watch(receiptProvider);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const _Background(),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    _TopBar(),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Center(
                        child: Stack(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            const Positioned(
                              top: 10,
                              child: ReceiptPrinter(),
                            ),
                            Positioned(
                              top: 85,
                              child: ReceiptSheet(receipt: receipt),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const _TimelineButton(),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF2F2F2), Color(0xFFEAEAEA)],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _CircleIconButton(
          icon: Icons.arrow_back_ios_new_rounded,
          iconSize: 16,
          onTap: () => Navigator.of(context).pop(),
        ),
        const Text(
          'Receipt',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Color(0xFF181818),
            height: 1,
          ),
        ),
        _CircleIconButton(
          icon: Icons.tune_rounded,
          iconSize: 20,
          onTap: () {},
        ),
      ],
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({
    required this.icon,
    required this.iconSize,
    required this.onTap,
  });

  final IconData icon;
  final double iconSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFC8C8C8),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF8E8E8E)),
          ),
          child: Icon(icon, size: iconSize, color: const Color(0xFF4F4F4F)),
        ),
      ),
    );
  }
}

class _TimelineButton extends StatelessWidget {
  const _TimelineButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 277,
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        borderRadius: BorderRadius.circular(18),
      ),
      alignment: Alignment.center,
      child: const Text(
        'View timeline',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
