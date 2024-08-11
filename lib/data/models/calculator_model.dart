import '../../domain/entities/calculator_entity.dart';

class CalculatorModel extends CalculatorEntity {
  CalculatorModel({
    required double firstNumber,
    required double secondNumber,
    required String operator,
  }) : super(firstNumber: firstNumber, secondNumber: secondNumber, operator: operator);
}
