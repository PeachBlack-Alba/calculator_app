abstract class CalculatorState {}

class CalculatorInitial extends CalculatorState {}

class CalculatorResult extends CalculatorState {
  final String result;

  CalculatorResult(this.result);
}
