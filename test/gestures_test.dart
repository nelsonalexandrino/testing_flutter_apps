import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testingapp/todo_list.dart';

void main() {
  testWidgets('Add and remove a todo', (WidgetTester tester) async {
    await tester.pumpWidget(TodoList());
    await tester.enterText(find.byType(TextField), 'Hello tester');
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.text('Hello tester'), findsOneWidget);
    await tester.drag(find.byType(Dismissible), Offset(500.00, 0.0));
    await tester.pumpAndSettle();
    expect(find.text('Hello tester'), findsNothing);
  });
}
