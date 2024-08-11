import '../data_sources/calculator_data_source.dart';
import '../models/calculator_model.dart';

class CalculatorRepository {
  final CalculatorDataSource dataSource;

  CalculatorRepository(this.dataSource);

  double calculate(CalculatorModel model) {
    return dataSource.calculate(model);
  }
}
