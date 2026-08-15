import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rakibul_portfolio/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Set desktop window size for portfolio web layout testing
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const RakibulPortfolioApp());
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.byType(RakibulPortfolioApp), findsOneWidget);
  });
}
