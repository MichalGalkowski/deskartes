import 'package:deskartes/models/quadratic_function.dart';
import 'package:deskartes/providers/quadratic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CForm extends ConsumerWidget {
  const CForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final function = ref.watch(quadraticFunctionProvider);
    final c = ref.watch(quadraticFunctionProvider).c;
    final cController =
        c == null ? TextEditingController() : TextEditingController(text: c);
    cController.selection = TextSelection.fromPosition(
        TextPosition(offset: cController.text.length));
    return Row(
      children: [
        const Text(
          'c = ',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 30,
          width: 40,
          child: TextFormField(
            controller: cController,
            cursorHeight: 20,
            onChanged: (value) {
              if (value.isNotEmpty) {
                QuadraticFunction newFunction = QuadraticFunction(
                    function.form,
                    function.a,
                    function.b,
                    value,
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
                    function.a,
                    function.b,
                    null,
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
