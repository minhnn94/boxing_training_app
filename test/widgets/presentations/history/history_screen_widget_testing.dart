import 'package:boxing_traning/common/shared_widgets/loading_error_widget.dart';
import 'package:boxing_traning/presentation/history_screen/history_screen.dart';
import 'package:boxing_traning/presentation/history_screen/widgets/history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grouped_list/grouped_list.dart';

void main() {
  testWidgets('HistoryScreen UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: HistoryScreen(),
      ),
    );

    // Verify that the app displays the title.
    expect(find.text('History'), findsOneWidget);

    // Verify that the "Load Data" button is initially present.
    expect(find.text('Load Data'), findsOneWidget);

    // Tap the "Load Data" button and trigger a frame.
    await tester.tap(find.text('Load Data'));
    await tester.pump();

    // Assuming HistoryCubit is a Cubit that emits HistoryLoadingSuccess state
    // after loading data, you can test if the data is displayed correctly.

    // Verify that the loading success state is handled.
    expect(find.byType(GroupedListView), findsOneWidget);
    expect(find.byType(HistoryItem), findsWidgets);

    // You may add more specific tests based on your widget structure.

    // You can also test the error state by changing the state emitted by HistoryCubit.

    // For example, if HistoryCubit emits HistoryError state:
    // context.read<HistoryCubit>().emit(HistoryError('Error message'));

    // Verify that the error state is handled.
    expect(find.byType(LoadingErrorWidget), findsOneWidget);
  });
}
