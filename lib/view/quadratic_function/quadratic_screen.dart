import 'package:deskartes/providers/quadratic_provider.dart';
import 'package:deskartes/view/quadratic_function/widgets/factored_results.dart';
import 'package:deskartes/view/quadratic_function/widgets/standard_results.dart';
import 'package:deskartes/view/quadratic_function/widgets/select_form.dart';
import 'package:deskartes/view/quadratic_function/widgets/variable_form.dart';
import 'package:deskartes/view/quadratic_function/widgets/vertex_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuadraticScreen extends ConsumerWidget {
  const QuadraticScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final functionForm = ref.watch(quadraticFunctionProvider).form;

    Widget conditionalWidget() {
      switch (functionForm) {
        case 'ogólna':
          return const StandardResults();
        case 'kanoniczna':
          return const VertexResults();
        case 'iloczynowa':
          return const FactoredResults();
        default:
          return const StandardResults();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Funkcja kwadratowa'),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: SelectForm(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: VariableForm(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: conditionalWidget(),
        ),
      ]),
    );
  }
}
