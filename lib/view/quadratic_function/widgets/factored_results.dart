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
    final xOne = function.xOne;
    final xOneParse = double.tryParse(xOne ?? '') ?? 0;
    final xTwo = function.xTwo;
    final xTwoParse = double.tryParse(xTwo ?? '') ?? 0;
    final b = FunctionHelper()
        .solveBFactor(a: aParse, xOne: xOneParse, xTwo: xTwoParse);
    final c = FunctionHelper()
        .solveCFactor(a: aParse, xOne: xOneParse, xTwo: xTwoParse);
    final delta = FunctionHelper().solveDelta(a: aParse, b: b, c: c);
    final p = FunctionHelper().solveP(a: aParse, b: b);
    final q = FunctionHelper().solveQ(a: aParse, delta: delta);
    String bParse = b.toStringAsFixed(1);
    if (b < 0) {
      bParse = bParse.substring(1);
    }
    String cParse = c.toStringAsFixed(1);
    if (c < 0) {
      cParse = cParse.substring(1);
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
                    'Delta=${delta.toStringAsFixed(1)}',
                    style: style,
                  ),
                  Text(
                    'b=${b.toStringAsFixed(1)}',
                    style: style,
                  ),
                  Text(
                    'c=${c.toStringAsFixed(1)}',
                    style: style,
                  ),
                  Text(
                    'p=${p.toStringAsFixed(1)}',
                    style: style,
                  ),
                  Text(
                    'q=${q.toStringAsFixed(1)}',
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
                    'wzór: b = -a(x₁+x₂)',
                    style: style,
                  ),
                  Text(
                    'wzór: c = ax₁x₂',
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
          'Ogólna: f(x)=${aParse.toStringAsFixed(1)}x²${b < 0 ? '-' : '+'}${bParse}x${c < 0 ? '-' : '+'}$cParse',
          style: style,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Kanoniczna: f(x)=${aParse.toStringAsFixed(1)}(x${p < 0 ? '+' : '-'}${p.toStringAsFixed(1)})²${q < 0 ? '' : '+'}${q.toStringAsFixed(1)}',
          style: style,
        ),
      ],
    );
  }
}
