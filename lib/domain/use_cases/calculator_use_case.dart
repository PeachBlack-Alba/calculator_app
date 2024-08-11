import '../../data/repositories/calculator_repository.dart';
import '../../data/models/calculator_model.dart';

class CalculateUseCase {
  final CalculatorRepository repository;

  CalculateUseCase(this.repository);

  double execute(CalculatorModel model) {
    return repository.calculate(model);
  }
}
