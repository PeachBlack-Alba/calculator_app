import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_app/presentation/pages/calculator_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculator_app/presentation/bloc/calculator_bloc.dart';
import 'package:calculator_app/injection_container.dart' as di;
import 'package:get_it/get_it.dart';

void main() {
  setUp(() {
    GetIt.I.reset(); // Reset GetIt to avoid duplicate registration issues
    di.init(); // Initialize dependencies
  });

  testWidgets('should display 0 initially', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => di.sl<CalculatorBloc>(),
          child: CalculatorPage(),
        ),
      ),
    );

    // Check if the calculator display is initialized with '0'
    final displayText = tester.widget<Text>(
        find.byKey(Key('calculatorDisplay')));
    expect(displayText.data, '0');
  });

  testWidgets('should display result after performing addition', (
      WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => di.sl<CalculatorBloc>(),
          child: CalculatorPage(),
        ),
      ),
    );

    // Perform 1 + 2 =
    await tester.tap(find.text('1'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('+'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('2'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('='));
    await tester.pumpAndSettle();

    // Expect the calculator display to show '3'
    final displayText = tester.widget<Text>(
        find.byKey(Key('calculatorDisplay')));
    expect(displayText.data, '3');
  });

  testWidgets(
      'should clear display when C is pressed', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => di.sl<CalculatorBloc>(),
          child: CalculatorPage(),
        ),
      ),
    );

    // Perform 1 + 2 C
    await tester.tap(find.text('1'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('+'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('2'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('C'));
    await tester.pumpAndSettle();

    // Expect the calculator display to show '0' after clearing
    final displayText = tester.widget<Text>(
        find.byKey(Key('calculatorDisplay')));
    expect(displayText.data, '0');
  });
}