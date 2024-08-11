import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:calculator_app/main.dart' as app;
import 'package:get_it/get_it.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    GetIt.I.reset();
  });

  group('Calculator Integration Tests', () {

    Finder _findButton(String text) {
      return find.descendant(
        of: find.byType(ElevatedButton),
        matching: find.text(text),
      );
    }

    Finder _findDisplay() {
      return find.byKey(Key('calculatorDisplay'));
    }

    testWidgets('Calculator addition test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Perform 7 + 3 = operation
      await tester.tap(_findButton('7'));
      await tester.pumpAndSettle();
      await tester.tap(_findButton('+'));
      await tester.pumpAndSettle();
      await tester.tap(_findButton('3'));
      await tester.pumpAndSettle();
      await tester.tap(_findButton('='));
      await tester.pumpAndSettle();

      // Check if the display shows '10'
      final displayText = tester.widget<Text>(_findDisplay());
      expect(displayText.data, '10');
    });

    testWidgets('Calculator subtraction test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Perform 9 - 4 = operation
      await tester.tap(_findButton('9'));
      await tester.pumpAndSettle();
      await tester.tap(_findButton('-'));
      await tester.pumpAndSettle();
      await tester.tap(_findButton('4'));
      await tester.pumpAndSettle();
      await tester.tap(_findButton('='));
      await tester.pumpAndSettle();

      // Check if the display shows '5'
      final displayText = tester.widget<Text>(_findDisplay());
      expect(displayText.data, '5');
    });

    testWidgets('Calculator multiplication test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Perform 6 * 7 = operation
      await tester.tap(_findButton('6'));
      await tester.pumpAndSettle();
      await tester.tap(_findButton('*'));
      await tester.pumpAndSettle();
      await tester.tap(_findButton('7'));
      await tester.pumpAndSettle();
      await tester.tap(_findButton('='));
      await tester.pumpAndSettle();

      // Check if the display shows '42'
      final displayText = tester.widget<Text>(_findDisplay());
      expect(displayText.data, '42');
    });

    testWidgets('Calculator division test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Perform 8 / 2 = operation
      await tester.tap(_findButton('8'));
      await tester.pumpAndSettle();
      await tester.tap(_findButton('/'));
      await tester.pumpAndSettle();
      await tester.tap(_findButton('2'));
      await tester.pumpAndSettle();
      await tester.tap(_findButton('='));
      await tester.pumpAndSettle();

      // Check if the display shows '4'
      final displayText = tester.widget<Text>(_findDisplay());
      expect(displayText.data, '4');
    });
  });
}
