import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_protfolio/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const RakibulPortfolioApp());
    expect(find.byType(RakibulPortfolioApp), findsOneWidget);
  });
}
