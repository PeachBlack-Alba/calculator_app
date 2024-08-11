import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
import 'presentation/bloc/calculator_bloc.dart';
import 'presentation/pages/calculator_page.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      home: BlocProvider(
        create: (_) => di.sl<CalculatorBloc>(),
        child: CalculatorPage(),
      ),
    );
  }
}
