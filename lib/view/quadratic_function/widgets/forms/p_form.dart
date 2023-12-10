import 'package:deskartes/models/quadratic_function.dart';
import 'package:deskartes/providers/quadratic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PForm extends ConsumerWidget {
  const PForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final function = ref.watch(quadraticFunctionProvider);
    final p = ref.watch(quadraticFunctionProvider).p;
    final pController =
        p == null ? TextEditingController() : TextEditingController(text: p);
    pController.selection = TextSelection.fromPosition(
        TextPosition(offset: pController.text.length));
    return Row(
      children: [
        const Text(
          'p = ',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 30,
          width: 40,
          child: TextFormField(
            controller: pController,
            cursorHeight: 20,
            onChanged: (value) {
              if (value.isNotEmpty) {
                QuadraticFunction newFunction = QuadraticFunction(
                    function.form,
                    function.a,
                    function.b,
                    function.c,
                    value,
                    function.q,
                    function.xOne,
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
                    null,
                    function.q,
                    function.xOne,
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
