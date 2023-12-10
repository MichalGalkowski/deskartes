import 'package:deskartes/providers/quadratic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/function_helper.dart';

class FactoredResults extends ConsumerWidget {
  const FactoredResults({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyle style = const TextStyle(fontSize: 20);
    final function = ref.watch(quadraticFunctionProvider);
    final a = function.a;
    final aParse = double.tryParse(a ?? '') ?? 0;
    final b = function.b;
    final bParse = double.tryParse(b ?? '') ?? 0;
    final c = function.c;
    final cParse = double.tryParse(c ?? '') ?? 0;
    final delta = FunctionHelper()
        .solveDelta(a: aParse, b: bParse, c: cParse)
        .roundToDouble();
    final xOne = FunctionHelper()
        .solveXOne(a: aParse, b: bParse, delta: delta)
        .roundToDouble();
    String xOneParse = xOne.toString();
    if (xOne < 0) {
      xOneParse = xOneParse.substring(1);
    }
    final xTwo = FunctionHelper()
        .solveXTwo(a: aParse, b: bParse, delta: delta)
        .roundToDouble();
    String xTwoParse = xTwo.toString();
    if (xTwo < 0) {
      xTwoParse = xTwoParse.substring(1);
    }
    final p = FunctionHelper().solveP(a: aParse, b: bParse);
    String pParse = p.toString();
    if (p < 0) {
      pParse = pParse.substring(1);
    }
    final q = FunctionHelper().solveQ(a: aParse, delta: delta);
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
                    'p=$p',
                    style: style,
                  ),
                  Text(
                    'q=$q',
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
                    'wzór: p = -b / 2a',
                    style: style,
                  ),
                  Text(
                    'wzór: q = -Δ / 4a',
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
          'Ogólna: f(x)=$aParse()',
          style: style,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Kanoniczna: f(x)=$aParse(x${p < 0 ? '+' : '-'}$pParse)²${q < 0 ? '' : '+'}$q',
          style: style,
        ),
      ],
    );
  }
}