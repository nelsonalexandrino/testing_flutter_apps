import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/widgets/my_widget_to_test.dart';

void main() {
  testWidgets('My widget has a title and a message',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyWidget(
      title: 'T',
      message: 'M',
    ));

    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('finds a widget using a key', (WidgetTester tester) async {
    final testKey = Key('K');
    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));
    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('finds a specific instance', (WidgetTester tester) async {
    final childWidget = Padding(padding: EdgeInsets.zero);

    await tester.pumpWidget(Container(child: childWidget));

    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
