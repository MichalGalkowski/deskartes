import 'package:deskartes/models/quadratic_function.dart';
import 'package:deskartes/providers/quadratic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QForm extends ConsumerWidget {
  const QForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final function = ref.watch(quadraticFunctionProvider);
    final q = ref.watch(quadraticFunctionProvider).q;
    final qController =
        q == null ? TextEditingController() : TextEditingController(text: q);
    qController.selection = TextSelection.fromPosition(
        TextPosition(offset: qController.text.length));
    return Row(
      children: [
        const Text(
          'q = ',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 30,
          width: 40,
          child: TextFormField(
            controller: qController,
            cursorHeight: 20,
            onChanged: (value) {
              if (value.isNotEmpty) {
                QuadraticFunction newFunction = QuadraticFunction(
                    function.form,
                    function.a,
                    function.b,
                    function.c,
                    function.p,
                    value,
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
                    function.p,
                    null,
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
