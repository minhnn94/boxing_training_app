import 'package:boxing_traning/common/shared_widgets/common_button.dart';
import 'package:boxing_traning/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Test Timer Boxing app', (WidgetTester tester) async {
    app.main();

    // await tester.pumpAndSettle();
    // await Future.delayed(Duration(seconds: 4));
    await tester.pumpAndSettle(Duration(seconds: 3));
    // Verify that the initial counter value is 0
    final createButton = find.byType(CommonButton).first;
    tester.tap(createButton);

    tester.pumpAndSettle();
    // createButton.
    // expect(find.text('Create new sport'), findsOneWidget);

    // // Tap the "+" button and verify that the counter value increases to 1
    // await tester.tap(find.byTooltip('Increment'));
    // await tester.pumpAndSettle();
    // expect(find.text('1'), findsOneWidget);
    //
    // // Tap the "+" button again and verify that the counter value increases to 2
    // await tester.tap(find.byTooltip('Increment'));
    // await tester.pumpAndSettle();
    // expect(find.text('2'), findsOneWidget);
  });
}
