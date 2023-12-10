import 'package:deskartes/models/quadratic_function.dart';
import 'package:deskartes/providers/quadratic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class XOneForm extends ConsumerWidget {
  const XOneForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final function = ref.watch(quadraticFunctionProvider);
    final xOne = ref.watch(quadraticFunctionProvider).xOne;
    final xOneController = xOne == null
        ? TextEditingController()
        : TextEditingController(text: xOne);
    xOneController.selection = TextSelection.fromPosition(
        TextPosition(offset: xOneController.text.length));
    return Row(
      children: [
        const Text(
          'x₁ = ',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 30,
          width: 40,
          child: TextFormField(
            controller: xOneController,
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
                    value,
                    function.xTwo);
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
                    null,
                    function.xTwo);
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
