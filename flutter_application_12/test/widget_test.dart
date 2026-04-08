import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_12/main.dart';

void main() {
  testWidgets('renders Student Record Manager home', (WidgetTester tester) async {
    await tester.pumpWidget(const StudentRecordManagerApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Student Record Manager'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
