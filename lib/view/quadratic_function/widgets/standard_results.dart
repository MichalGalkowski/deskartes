import 'package:deskartes/models/quadratic_function.dart';
import 'package:deskartes/providers/quadratic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/function_helper.dart';

class StandardResults extends ConsumerWidget {
  const StandardResults({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyle style = const TextStyle(fontSize: 20);
    final function = ref.watch(quadraticFunctionProvider);
    String? a = function.a;
    if (a == '0') {
      a = '1';
    }
    final aParse = double.tryParse(a ?? '1') ?? 1;
    final b = function.b;
    final bParse = double.tryParse(b ?? '') ?? 0;
    final c = function.c;
    final cParse = double.tryParse(c ?? '') ?? 0;
    final delta = FunctionHelper().solveDelta(a: aParse, b: bParse, c: cParse);
    final xOne = FunctionHelper().solveXOne(a: aParse, b: bParse, delta: delta);
    String xOneParse = xOne.toStringAsFixed(1);
    if (xOne < 0) {
      xOneParse = xOneParse.substring(1);
    }
    final xTwo = FunctionHelper().solveXTwo(a: aParse, b: bParse, delta: delta);
    String xTwoParse = xTwo.toStringAsFixed(1);
    if (xTwo < 0) {
      xTwoParse = xTwoParse.substring(1);
    }
    final p = FunctionHelper().solveP(a: aParse, b: bParse);
    String pParse = p.toStringAsFixed(1);
    if (p < 0) {
      pParse = pParse.substring(1);
    }
    final q = FunctionHelper().solveQ(a: aParse, delta: delta);
    final updatedFunction = QuadraticFunction(
        function.form,
        function.a,
        function.b,
        function.c,
        p.toStringAsFixed(1),
        q.toStringAsFixed(1),
        xOne.toStringAsFixed(1),
        xTwo.toStringAsFixed(1));

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
                    'x₁=${xOne.toStringAsFixed(1)}',
                    style: style,
                  ),
                  Text(
                    'x₂=${xTwo.toStringAsFixed(1)}',
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
          'Kanoniczna: f(x)=${aParse.toStringAsFixed(1)}(x${p < 0 ? '+' : '-'}$pParse)²${q < 0 ? '' : '+'}${q.toStringAsFixed(1)}',
          style: style,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Iloczynowa: f(x)=${aParse.toStringAsFixed(1)}(x${xOne < 0 ? '+' : '-'}$xOneParse)(x${xTwo < 0 ? '+' : '-'}$xTwoParse)',
          style: style,
        ),
        const SizedBox(
          height: 12,
        ),
        OutlinedButton(
            onPressed: () => ref
                .read(quadraticFunctionProvider.notifier)
                .setFunction(updatedFunction),
            child: const Text('Pokaż na osi')),
      ],
    );
  }
}
