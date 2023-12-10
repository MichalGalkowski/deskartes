import 'package:deskartes/providers/quadratic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectForm extends ConsumerWidget {
  const SelectForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quadraticFunction = ref.watch(quadraticFunctionProvider);
    final quadraticForm = ref.watch(quadraticFunctionProvider).form;
    final a = quadraticFunction.a;
    final b = quadraticFunction.b;
    final bParse = double.tryParse(b ?? '') ?? 0;
    final c = quadraticFunction.c;
    final cParse = double.tryParse(c ?? '') ?? 0;
    String? p = quadraticFunction.p;
    final pParse = double.tryParse(p ?? '') ?? 0;
    final q = quadraticFunction.q;
    final qParse = double.tryParse(q ?? '') ?? 0;
    String? xOne = quadraticFunction.xOne;
    final xOneParse = double.tryParse(xOne ?? '') ?? 0;
    String? xTwo = quadraticFunction.xTwo;
    final xTwoParse = double.tryParse(xTwo ?? '') ?? 0;

    Widget formula() {
      TextStyle style = const TextStyle(fontSize: 22);
      switch (quadraticForm) {
        case 'ogólna':
          return Column(
            children: [
              Text(
                'f(x)=${a ?? 'a'}x²${b != null && bParse < 0 ? '' : '+'}${b ?? 'b'}x${c != null && cParse < 0 ? '' : '+'}${c ?? 'c'}',
                style: style,
              ),
            ],
          );
        case 'kanoniczna':
          if (pParse < 0) {
            p = p!.substring(1);
          }
          return Text(
            'f(x)=${a ?? 'a'}(x${p != null && pParse < 0 ? '+' : '-'}${p ?? 'p'})²${q != null && qParse < 0 ? '' : '+'}${q ?? 'q'}',
            style: style,
          );
        case 'iloczynowa':
          if (xOneParse < 0) {
            xOne = xOne!.substring(1);
          }
          if (xTwoParse < 0) {
            xTwo = xTwo!.substring(1);
          }
          return Text(
            'f(x) =  ${a ?? 'a'}(x${xOne != null && xOneParse < 0 ? '+' : '-'}${xOne ?? 'x₁'})(x${xTwo != null && xTwoParse < 0 ? '+' : '-'}${xTwo ?? 'x₂'})',
            style: style,
          );
        default:
          return Text('f(x) =  $a x² + $b x + $c');
      }
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => ref
                  .read(quadraticFunctionProvider.notifier)
                  .previousFunction(),
              icon: const Icon(
                Icons.arrow_left,
                size: 34,
              ),
            ),
            Text(
              'Postać $quadraticForm',
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            IconButton(
              onPressed: () =>
                  ref.read(quadraticFunctionProvider.notifier).nextFunction(),
              icon: const Icon(
                Icons.arrow_right,
                size: 34,
              ),
            ),
          ],
        ),
        formula(),
      ],
    );
  }
}
