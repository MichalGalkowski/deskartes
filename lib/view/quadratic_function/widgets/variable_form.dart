import 'package:deskartes/providers/quadratic_provider.dart';
import 'package:deskartes/view/quadratic_function/widgets/forms/a_form.dart';
import 'package:deskartes/view/quadratic_function/widgets/forms/b_form.dart';
import 'package:deskartes/view/quadratic_function/widgets/forms/c_form.dart';
import 'package:deskartes/view/quadratic_function/widgets/forms/p_form.dart';
import 'package:deskartes/view/quadratic_function/widgets/forms/q_form.dart';
import 'package:deskartes/view/quadratic_function/widgets/forms/x_one_form.dart';
import 'package:deskartes/view/quadratic_function/widgets/forms/x_two_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VariableForm extends ConsumerWidget {
  const VariableForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final function = ref.watch(quadraticFunctionProvider);

    switch (function.form) {
      case 'ogólna':
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            AForm(),
            BForm(),
            CForm(),
          ],
        );
      case 'kanoniczna':
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            AForm(),
            PForm(),
            QForm(),
          ],
        );
      case 'iloczynowa':
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            AForm(),
            XOneForm(),
            XTwoForm(),
          ],
        );
      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            AForm(),
            BForm(),
            CForm(),
          ],
        );
    }
  }
}
