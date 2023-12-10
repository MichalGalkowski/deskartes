import 'dart:math';

class FunctionHelper {
  double solveDelta({required double a, required double b, required double c}) {
    double delta = b * b - 4 * a * c;
    return delta;
  }

  double solveXOne(
      {required double a, required double b, required double delta}) {
    double xTop = -b - sqrt(delta);
    double xBottom = 2 * a;
    double xOne = xTop / xBottom;
    return xOne;
  }

  double solveXTwo(
      {required double a, required double b, required double delta}) {
    double xTop = -b + sqrt(delta);
    double xBottom = 2 * a;
    double xTwo = xTop / xBottom;
    return xTwo;
  }

  double solveP({required double a, required double b}) {
    double pTop = -b;
    double pBottom = 2 * a;
    double p = pTop / pBottom;
    return p;
  }

  double solveQ({required double a, required double delta}) {
    double qTop = -delta;
    double qBottom = 4 * a;
    double q = qTop / qBottom;
    return q;
  }

  double solveB({required double a, required double p}) {
    double b = -2 * a * p;
    return b;
  }

  double solveC({required double a, required double p, required double q}) {
    double pSquare = p * p;
    double c = a * pSquare + q;
    return c;
  }
}
