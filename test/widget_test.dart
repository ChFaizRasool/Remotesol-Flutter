import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:remotesol/main.dart';

void main() {
  testWidgets('App loads without crashing', (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(RemoteSolApp());

    // Verify MaterialApp exists
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
