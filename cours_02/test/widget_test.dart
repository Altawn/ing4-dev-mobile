import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formation_flutter/main.dart';
import 'package:formation_flutter/screens/product_page.dart';

void main() {
  testWidgets('App uses ProductPage smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the ProductPage is shown.
    expect(find.byType(ProductPage), findsOneWidget);
  });
}
