import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_app/data/data_sources/calculator_data_source.dart';
import 'package:calculator_app/data/models/calculator_model.dart';

void main() {
  late CalculatorDataSource dataSource;

  setUp(() {
    dataSource = CalculatorDataSource();
  });

  test('should return correct sum when operator is "+"', () {
    final model = CalculatorModel(firstNumber: 4, secondNumber: 5, operator: '+');
    final result = dataSource.calculate(model);
    expect(result, 9);
  });

  test('should return correct difference when operator is "-"', () {
    final model = CalculatorModel(firstNumber: 9, secondNumber: 5, operator: '-');
    final result = dataSource.calculate(model);
    expect(result, 4);
  });

  test('should return correct product when operator is "*"', () {
    final model = CalculatorModel(firstNumber: 3, secondNumber: 3, operator: '*');
    final result = dataSource.calculate(model);
    expect(result, 9);
  });

  test('should return correct quotient when operator is "/"', () {
    final model = CalculatorModel(firstNumber: 10, secondNumber: 2, operator: '/');
    final result = dataSource.calculate(model);
    expect(result, 5);
  });

  test('should throw an exception when operator is invalid', () {
    final model = CalculatorModel(firstNumber: 4, secondNumber: 5, operator: '%');
    expect(() => dataSource.calculate(model), throwsException);
  });
}
