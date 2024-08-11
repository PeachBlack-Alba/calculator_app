import 'package:calculator_app/domain/use_cases/calculator_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';
import '../../data/models/calculator_model.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final CalculateUseCase calculateUseCase;

  double _firstNumber = 0;
  double _secondNumber = 0;
  String _operator = '';
  String _display = '';
  bool _hasDecimal = false;

  CalculatorBloc(this.calculateUseCase) : super(CalculatorInitial()) {
    on<NumberPressed>((event, emit) {
      if (_display == '0') {
        _display = event.number;
      } else {
        _display += event.number;
      }
      emit(CalculatorResult(_display));
    });

    on<OperatorPressed>((event, emit) {
      if (_display.isNotEmpty) {
        _firstNumber = double.parse(_display);
        _operator = event.operator;
        _display = '';
        _hasDecimal = false;
      }
    });

    on<EqualsPressed>((event, emit) {
      if (_display.isNotEmpty && _operator.isNotEmpty) {
        _secondNumber = double.parse(_display);
        final model = CalculatorModel(
          firstNumber: _firstNumber,
          secondNumber: _secondNumber,
          operator: _operator,
        );
        final result = calculateUseCase.execute(model);

        // Check if the result is an integer or a decimal
        if (result == result.toInt()) {
          _display = result.toInt().toString();
        } else {
          _display = result.toString();
        }

        emit(CalculatorResult(_display));
        _operator = '';
        _hasDecimal = _display.contains('.');
      }
    });

    on<ClearPressed>((event, emit) {
      _display = '0';
      _operator = '';
      _firstNumber = 0;
      _secondNumber = 0;
      _hasDecimal = false;
      emit(CalculatorResult(_display));
    });

    on<DecimalPressed>((event, emit) {
      if (!_hasDecimal) {
        _display += '.';
        _hasDecimal = true;
        emit(CalculatorResult(_display));
      }
    });
  }
}
