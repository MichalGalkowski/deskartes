import 'package:deskartes/models/quadratic_function.dart';
import 'package:deskartes/providers/quadratic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AForm extends ConsumerWidget {
  const AForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final function = ref.watch(quadraticFunctionProvider);
    final a = ref.watch(quadraticFunctionProvider).a;
    final aController =
        a == null ? TextEditingController() : TextEditingController(text: a);
    aController.selection = TextSelection.fromPosition(
        TextPosition(offset: aController.text.length));
    return Row(
      children: [
        const Text(
          'a = ',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 30,
          width: 40,
          child: TextFormField(
            controller: aController,
            cursorHeight: 20,
            onChanged: (value) {
              if (value.isNotEmpty) {
                QuadraticFunction newFunction = QuadraticFunction(
                    function.form,
                    value,
                    function.b,
                    function.c,
                    function.p,
                    function.q,
                    function.xOne,
                    function.xTwo);
                ref
                    .read(quadraticFunctionProvider.notifier)
                    .setFunction(newFunction);
              } else {
                QuadraticFunction newFunction = QuadraticFunction(
                    function.form,
                    null,
                    function.b,
                    function.c,
                    function.p,
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
