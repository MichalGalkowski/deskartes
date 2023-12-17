import 'package:deskartes/providers/quadratic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../helpers/function_helper.dart';
import '../../../models/quadratic_function.dart';

class VertexResults extends ConsumerWidget {
  const VertexResults({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyle style = const TextStyle(fontSize: 20);
    final function = ref.watch(quadraticFunctionProvider);
    String? a = function.a;
    if (a == '0') {
      a = '1';
    }
    final aParse = double.tryParse(a ?? '1') ?? 1;
    final p = function.p;
    final pParse = double.tryParse(p ?? '') ?? 0;
    final q = function.q;
    final qParse = double.tryParse(q ?? '') ?? 0;
    final b = FunctionHelper().solveB(a: aParse, p: pParse);
    final c = FunctionHelper().solveC(a: aParse, p: pParse, q: qParse);
    final delta = FunctionHelper().solveDelta(a: aParse, b: b, c: c);
    final xOne = FunctionHelper().solveXOne(a: aParse, b: b, delta: delta);
    String xOneParse = xOne.toStringAsFixed(1);
    if (xOne < 0) {
      xOneParse = xOneParse.substring(1);
    }
    final xTwo = FunctionHelper().solveXTwo(a: aParse, b: b, delta: delta);
    String xTwoParse = xTwo.toStringAsFixed(1);
    if (xTwo < 0) {
      xTwoParse = xTwoParse.substring(1);
    }
    String bParse = b.toStringAsFixed(1);
    if (b < 0) {
      bParse = bParse.substring(1);
    }
    String cParse = c.toStringAsFixed(1);
    if (c < 0) {
      cParse = cParse.substring(1);
    }

    final updatedFunction = QuadraticFunction(
        function.form,
        function.a,
        b.toStringAsFixed(1),
        c.toStringAsFixed(1),
        p,
        q,
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
                    'b=${b.toStringAsFixed(1)}',
                    style: style,
                  ),
                  Text(
                    'c=${c.toStringAsFixed(1)}',
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
          'Ogólna: f(x)=${aParse}x²${b < 0 ? '-' : '+'}${bParse}x${c < 0 ? '-' : '+'}$cParse',
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
