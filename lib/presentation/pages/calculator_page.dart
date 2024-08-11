import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/calculator_bloc.dart';
import '../bloc/calculator_event.dart';
import '../bloc/calculator_state.dart';
import '../widgets/number_button.dart';
import '../widgets/operator_button.dart';


class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                String display = '0';
                if (state is CalculatorResult) {
                  display = state.result;
                }
                return Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    display,
                    key: Key('calculatorDisplay'),
                    style: TextStyle(fontSize: 48),
                  ),
                );
              },
            ),
          ),
          Divider(),
          _buildButtonRow(context, ['7', '8', '9', '/']),
          _buildButtonRow(context, ['4', '5', '6', '*']),
          _buildButtonRow(context, ['1', '2', '3', '-']),
          _buildButtonRow(context, ['0', '.', '=', '+']),
          _buildButtonRow(context, ['C']),
        ],
      ),
    );
  }

  Widget _buildButtonRow(BuildContext context, List<String> labels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: labels.map((label) {
        return _buildButton(context, label);
      }).toList(),
    );
  }

  Widget _buildButton(BuildContext context, String label) {
    if (RegExp(r'[0-9]').hasMatch(label)) {
      return NumberButton(
        label: label,
        onPressed: () {
          context.read<CalculatorBloc>().add(NumberPressed(label));
        },
      );
    } else {
      return OperatorButton(
        label: label,
        onPressed: () {
          _onOperatorPressed(context, label);
        },
      );
    }
  }

  void _onOperatorPressed(BuildContext context, String label) {
    final bloc = context.read<CalculatorBloc>();
    if (label == '+' || label == '-' || label == '*' || label == '/') {
      bloc.add(OperatorPressed(label));
    } else if (label == '=') {
      bloc.add(EqualsPressed());
    } else if (label == 'C') {
      bloc.add(ClearPressed());
    } else if (label == '.') {
      bloc.add(DecimalPressed());
    }
  }
}
