import 'package:deskartes/models/quadratic_function.dart';
import 'package:deskartes/providers/quadratic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class XTwoForm extends ConsumerWidget {
  const XTwoForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final function = ref.watch(quadraticFunctionProvider);
    final xTwo = ref.watch(quadraticFunctionProvider).xTwo;
    final xTwoController = xTwo == null
        ? TextEditingController()
        : TextEditingController(text: xTwo);
    xTwoController.selection = TextSelection.fromPosition(
        TextPosition(offset: xTwoController.text.length));
    return Row(
      children: [
        const Text(
          'x₂ = ',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 30,
          width: 40,
          child: TextFormField(
            controller: xTwoController,
            cursorHeight: 20,
            onChanged: (value) {
              if (value.isNotEmpty) {
                QuadraticFunction newFunction = QuadraticFunction(
                    function.form,
                    function.a,
                    function.b,
                    function.c,
                    function.p,
                    function.q,
                    function.xOne,
                    value);
                ref
                    .read(quadraticFunctionProvider.notifier)
                    .setFunction(newFunction);
              } else {
                QuadraticFunction newFunction = QuadraticFunction(
                    function.form,
                    function.a,
                    function.b,
                    function.c,
                    function.p,
                    function.q,
                    function.xOne,
                    null);
                ref
                    .read(quadraticFunctionProvider.notifier)
                    .setFunction(newFunction);
              }
            },
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
