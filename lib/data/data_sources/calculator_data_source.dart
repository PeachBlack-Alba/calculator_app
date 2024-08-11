import '../models/calculator_model.dart';

class CalculatorDataSource {
  double calculate(CalculatorModel model) {
    switch (model.operator) {
      case '+':
        return model.firstNumber + model.secondNumber;
      case '-':
        return model.firstNumber - model.secondNumber;
      case '*':
        return model.firstNumber * model.secondNumber;
      case '/':
        return model.firstNumber / model.secondNumber;
      default:
        throw Exception('Invalid operator');
    }
  }
}
