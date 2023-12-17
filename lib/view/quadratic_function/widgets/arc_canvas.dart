// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deskartes/providers/quadratic_provider.dart';

class ArcCanvas extends ConsumerWidget {
  const ArcCanvas({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final function = ref.watch(quadraticFunctionProvider);
    final xOne = double.tryParse(function.xOne ?? '0') ?? 0;
    final xTwo = double.tryParse(function.xTwo ?? '0') ?? 0;
    final q = double.tryParse(function.q ?? '0') ?? 0;
    final p = double.tryParse(function.p ?? '0') ?? 0;
    return SizedBox(
      width: width,
      height: width,
      child: CustomPaint(
        foregroundPainter: Arc(q: q, p: p, xOne: xOne, xTwo: xTwo),
      ),
    );
  }
}

class Arc extends CustomPainter {
  double q;
  double p;
  double xOne;
  double xTwo;
  Arc({
    required this.q,
    required this.p,
    required this.xOne,
    required this.xTwo,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.width * .5;
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // final arc = Path();
    // arc.moveTo(size.width * .5 + xOne * 20, size.height * .5);
    // double x2 = center + (xOne * 20);
    // double y2 = center - (q * 20);
    // arc.cubicTo(x1, y1, x2, y2, x3, y3);
    // x1 = center + (p * 20);
    // y1 = center - (q * 20);
    // x2 = center + (xTwo * 20);
    // y2 = center - (q * 20);
    // x3 = center + (xTwo * 20);
    // y3 = center;
    // arc.cubicTo(x1, y1, x2, y2, x3, y3);
    // canvas.drawPath(arc, paint);

    double xOneX = center + (xOne * 20);
    double xOneY = center;
    double xTwoX = center + (xTwo * 20);
    double xTwoY = center;
    double qx = center + (p * 20);
    double qy = center - (q * 20);
    double arcX = center + (xOne * 20);
    double arcY = qy;
    final arcLeft = Path();
    final arcRight = Path();
    arcLeft.moveTo(qx, qy);
    arcLeft.cubicTo(qx, qy, arcX, arcY, xOneX, xOneY);
    arcRight.moveTo(qx, qy);
    arcX = center + (xTwo * 20);
    arcRight.cubicTo(qx, qy, arcX, arcY, xTwoX, xTwoY);

    canvas.drawPath(arcLeft, paint);
    canvas.drawPath(arcRight, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
