import 'package:deskartes/providers/quadratic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/function_helper.dart';

class VertexResults extends ConsumerWidget {
  const VertexResults({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyle style = const TextStyle(fontSize: 20);
    final function = ref.watch(quadraticFunctionProvider);
    final a = function.a;
    final aParse = double.tryParse(a ?? '') ?? 0;
    final p = function.p;
    final pParse = double.tryParse(p ?? '') ?? 0;
    final q = function.q;
    final qParse = double.tryParse(q ?? '') ?? 0;
    final b = FunctionHelper().solveB(a: aParse, p: pParse);
    final c = FunctionHelper().solveC(a: aParse, p: pParse, q: qParse);
    final delta =
        FunctionHelper().solveDelta(a: aParse, b: b, c: c).roundToDouble();
    final xOne = FunctionHelper()
        .solveXOne(a: aParse, b: b, delta: delta)
        .roundToDouble();
    String xOneParse = xOne.toString();
    if (xOne < 0) {
      xOneParse = xOneParse.substring(1);
    }
    final xTwo = FunctionHelper()
        .solveXTwo(a: aParse, b: b, delta: delta)
        .roundToDouble();
    String xTwoParse = xTwo.toString();
    if (xTwo < 0) {
      xTwoParse = xTwoParse.substring(1);
    }

    return Column(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delta=$delta',
                    style: style,
                  ),
                  Text(
                    'x₁=$xOne',
                    style: style,
                  ),
                  Text(
                    'x₂=$xTwo',
                    style: style,
                  ),
                  Text(
                    'b=$b',
                    style: style,
                  ),
                  Text(
                    'c=$c',
                    style: style,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'wzór: Δ = b² - 4ac',
                    style: style,
                  ),
                  Text(
                    'wzór: x₁ = -b - √Δ / 2a',
                    style: style,
                  ),
                  Text(
                    'wzór: x₂ = -b + √Δ / 2a',
                    style: style,
                  ),
                  Text(
                    'wzór: b = -2ap',
                    style: style,
                  ),
                  Text(
                    'wzór: c = ap² + q',
                    style: style,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Postać:',
          style: style,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Ogólna: f(x)=$aParse',
          style: style,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Iloczynowa: f(x)=$aParse(x${xOne < 0 ? '+' : '-'}$xOneParse)(x${xTwo < 0 ? '+' : '-'}$xTwoParse)',
          style: style,
        ),
      ],
    );
  }
}
