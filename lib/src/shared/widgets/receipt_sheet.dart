import 'package:flutter/material.dart';

import '../../features/receipt/models/receipt_data.dart';

class ReceiptSheet extends StatelessWidget {
  const ReceiptSheet({super.key, required this.receipt});

  final ReceiptData receipt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 276,
      height: 530,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: const [
          BoxShadow(
            color: Color(0x2B000000),
            blurRadius: 18,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 28),
          const _AvatarEmoji(),
          const SizedBox(height: 0),
          Text(
            'Thank you ${receipt.recipientName}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF222222),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            receipt.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12.5,
              height: 1.05,
              color: Color(0xFFAAAAAA),
            ),
          ),
          const SizedBox(height: 15),
          _DividerLine(),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _LabelColumn(labels: [receipt.dateLabel, receipt.orderLabel]),
                const SizedBox(width: 36),
                _ValueColumn(values: [receipt.dateValue, receipt.orderValue]),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 12,
            color: const Color(0xFFF7F7F7),
            alignment: Alignment.center,
            child: const Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 8,
                color: Color(0xFF000000),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _ProductThumb(),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        receipt.productName,
                        style: const TextStyle(
                          fontSize: 9.8,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF232323),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        receipt.productSku,
                        style: const TextStyle(
                          fontSize: 8.5,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const _DividerLine(padding: EdgeInsets.symmetric(horizontal: 14)),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  receipt.totalLabel,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF343434),
                  ),
                ),
                const Spacer(),
                Text(
                  receipt.totalAmount,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF7A7A7A),
                  ),
                ),
                const SizedBox(width: 8),
                _PaidChip(label: receipt.statusLabel),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const _Barcode(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _AvatarEmoji extends StatelessWidget {
  const _AvatarEmoji();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '👩🏻\u200d🦰',
      style: TextStyle(fontSize: 39),
    );
  }
}

class _DividerLine extends StatelessWidget {
  const _DividerLine({this.padding = const EdgeInsets.symmetric(horizontal: 13)});

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: 10,
        child: LayoutBuilder(
          builder: (context, constraints) {
            const dotSize = 1.4;
            const dotGap = 1.6;
            final dotCount = (constraints.maxWidth / (dotSize + dotGap)).floor();

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                dotCount,
                (_) => Container(
                  width: dotSize,
                  height: dotSize,
                  decoration: BoxDecoration(
                    color: const Color(0xFF000000),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _LabelColumn extends StatelessWidget {
  const _LabelColumn({required this.labels});

  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: labels
          .map(
            (label) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF363636),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ValueColumn extends StatelessWidget {
  const _ValueColumn({required this.values});

  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: values
          .map(
            (value) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF989898),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ProductThumb extends StatelessWidget {
  const _ProductThumb();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xFFECECEC),
        border: Border.all(color: const Color(0xFFD2D2D2)),
      ),
      child: const Center(
        child: Icon(Icons.watch_outlined, size: 14, color: Color(0xFF7C7C7C)),
      ),
    );
  }
}

class _PaidChip extends StatelessWidget {
  const _PaidChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFE6FBEC),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFF22D366),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.check_rounded,
                size: 5,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF1BAE54),
              fontSize: 9.2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _Barcode extends StatelessWidget {
  const _Barcode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 122,
      height: 47,
      child: CustomPaint(
        painter: _BarcodePainter(),
      ),
    );
  }
}

class _BarcodePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF161616)
      ..isAntiAlias = false;

    const pattern = <int>[
      1, 1, 3, 1, 1, 2, 4, 1, 1, 3, 2, 1, 1, 4, 1, 2, 3, 1, 1, 2, 2, 1,
      1, 3, 1, 4, 2, 1, 3, 1, 1, 2, 4, 1, 1, 3, 2, 1, 1, 2,
    ];
    const unit = 1.0;
    const gap = 0.65;
    final barTop = 4.0;
    final barHeight = 28.0;

    final leftGuardX = 4.0;
    canvas.drawRect(Rect.fromLTWH(leftGuardX, barTop - 2, 1.5, barHeight + 4), paint);
    canvas.drawRect(Rect.fromLTWH(leftGuardX + 3.5, barTop - 2, 1.0, barHeight + 4), paint);

    var x = 9.0;
    for (var i = 0; i < pattern.length; i++) {
      final width = pattern[i] * unit;
      if (i.isEven) {
        canvas.drawRect(Rect.fromLTWH(x, barTop, width, barHeight), paint);
      }
      x += width + gap;
    }

    final rightGuardX = size.width - 8.0;
    canvas.drawRect(Rect.fromLTWH(rightGuardX, barTop - 2, 1.0, barHeight + 4), paint);
    canvas.drawRect(Rect.fromLTWH(rightGuardX + 2.5, barTop - 2, 1.5, barHeight + 4), paint);

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: const TextSpan(
        style: TextStyle(fontSize: 6.2, letterSpacing: 0.2, color: Color(0xFF8A8A8A)),
        children: [
          TextSpan(text: '6'),
          TextSpan(text: '3'),
          TextSpan(text: '9'),
          TextSpan(text: '7'),
          TextSpan(text: '2'),
          TextSpan(text: '7'),
          TextSpan(text: '1'),
          TextSpan(text: '2'),
          TextSpan(text: '7'),
          TextSpan(text: '7'),
          TextSpan(text: '2'),
          TextSpan(text: '3'),
        ],
      ),
    )..layout();
    textPainter.paint(canvas, Offset((size.width - textPainter.width) / 2, 34));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
