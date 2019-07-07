import 'package:meta/meta.dart';
import 'package:test/test.dart';

void main() {
  group('calculator test', () {
    Calculator calculator;

    setUp(() async {
      calculator = Calculator();
    });

    tearDown(() async {
      calculator = null;
    });

    test('test add', () async {
      expect(calculator.add(1, 2), equals(3));
      expect(calculator.add(0, 2), equals(2));
      expect(calculator.add(-3, 2), equals(-1));
      expect(calculator.add(-1, -2), equals(-3));
    });

    test('test sub', () async {
      expect(calculator.sub(1, 2), equals(-1));
      expect(calculator.sub(0, 2), equals(-2));
      expect(calculator.sub(-3, 2), equals(-5));
      expect(calculator.sub(-1, -2), equals(1));
    });

    test('test mul', () async {
      expect(calculator.mul(1, 2), equals(2));
      expect(calculator.mul(0, 2), equals(0));
      expect(calculator.mul(-3, 2), equals(-6));
      expect(calculator.mul(-1, -2), equals(2));
    });

    test('test div', () async {
      expect(calculator.div(1, 2), equals(0.5));
      expect(calculator.div(0, 2), equals(0));
      expect(calculator.div(-3, 2), equals(-1.5));
      expect(calculator.div(-1, -2), equals(0.5));
    });
  });
}

@immutable
class Calculator {
  num add(num a, num b) => a + b;

  num sub(num a, num b) => a - b;

  num mul(num a, num b) => a * b;

  num div(num a, num b) => a / b;
}
