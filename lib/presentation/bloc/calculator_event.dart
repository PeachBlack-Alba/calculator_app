abstract class CalculatorEvent {}

class NumberPressed extends CalculatorEvent {
  final String number;

  NumberPressed(this.number);
}

class OperatorPressed extends CalculatorEvent {
  final String operator;

  OperatorPressed(this.operator);
}

class EqualsPressed extends CalculatorEvent {}

class ClearPressed extends CalculatorEvent {}

class DecimalPressed extends CalculatorEvent {}
