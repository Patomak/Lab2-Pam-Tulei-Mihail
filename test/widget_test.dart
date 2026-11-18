import 'package:flutter_test/flutter_test.dart';
import 'package:lab2misha/main.dart';

void main() {
  testWidgets('fitness home opens the gym training screen', (tester) async {
    await tester.pumpWidget(const FitnessApp());

    expect(find.text('Good Morning'), findsOneWidget);
    expect(find.text('Massive Upper Body'), findsOneWidget);

    await tester.tap(find.text('Massive Upper Body'));
    await tester.pumpAndSettle();

    expect(find.text('Mid City Gym Training'), findsOneWidget);
    expect(find.text('Reserve'), findsOneWidget);
  });
}
