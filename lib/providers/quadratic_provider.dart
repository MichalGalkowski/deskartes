import 'package:deskartes/models/quadratic_function.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<QuadraticFunction> quadraticForms = [
  QuadraticFunction('ogólna', null, null, null, null, null, null, null),
  QuadraticFunction('kanoniczna', null, null, null, null, null, null, null),
  QuadraticFunction('iloczynowa', null, null, null, null, null, null, null),
];

class QuadraticFunctionNotifier extends StateNotifier<QuadraticFunction> {
  QuadraticFunctionNotifier() : super(quadraticForms[0]);

  void setFunction(QuadraticFunction function) {
    state = function;
  }

  void nextFunction() {
    int index = 0;
    if (state.a != null ||
        state.b != null ||
        state.c != null ||
        state.p != null ||
        state.q != null ||
        state.xOne != null ||
        state.xTwo != null) {
      switch (state.form) {
        case 'ogólna':
          index = 1;
          break;
        case 'kanoniczna':
          index = 2;
          break;
        case 'iloczynowa':
          index = 0;
      }
      state = quadraticForms[index];
    } else {
      if (state == quadraticForms[quadraticForms.length - 1]) {
        state = quadraticForms[0];
      } else {
        state = quadraticForms[quadraticForms.indexOf(state) + 1];
      }
    }
  }

  void previousFunction() {
    int index = 0;
    if (state.a != null ||
        state.b != null ||
        state.c != null ||
        state.p != null ||
        state.q != null ||
        state.xOne != null ||
        state.xTwo != null) {
      switch (state.form) {
        case 'ogólna':
          index = 2;
          break;
        case 'kanoniczna':
          index = 0;
          break;
        case 'iloczynowa':
          index = 1;
      }
      state = quadraticForms[index];
    } else {
      if (state == quadraticForms[0]) {
        state = quadraticForms[quadraticForms.length - 1];
      } else {
        state = quadraticForms[quadraticForms.indexOf(state) - 1];
      }
    }
  }
}

final quadraticFunctionProvider =
    StateNotifierProvider<QuadraticFunctionNotifier, QuadraticFunction>(
        (ref) => QuadraticFunctionNotifier());
