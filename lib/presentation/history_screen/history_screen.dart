import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/constant/sized_box_constant.dart';
import 'package:boxing_traning/common/shared_widgets/appbar_common.dart';
import 'package:boxing_traning/common/shared_widgets/base_scaffold.dart';
import 'package:boxing_traning/common/shared_widgets/common_button.dart';
import 'package:boxing_traning/common/shared_widgets/loading_error_widget.dart';
import 'package:boxing_traning/common/time_utils.dart';
import 'package:boxing_traning/domain/models/history_template.dart';
import 'package:boxing_traning/presentation/history_screen/history_cubit.dart';
import 'package:boxing_traning/presentation/history_screen/widgets/history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import 'widgets/history_header.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: AppBarCommon(
          title: AppLocalizationUtils.instance().history,
        ),
        body: Column(
          children: [
            sizedHeight16,
            BlocBuilder<HistoryCubit, HistoryState>(
              builder: (context, state) {
                if (state is HistoryLoadingSuccess) {
                  return Expanded(
                    //   child: ListView.separated(
                    //     itemBuilder: (_, index) {
                    //       final item = state.data[index];
                    //       return HistoryItem(
                    //         item: item,
                    //       );
                    //     },
                    //     separatorBuilder: (_, __) => sizedHeight08,
                    //     itemCount: state.data.length,
                    //   ),

                    child: GroupedListView(
                      floatingHeader: true,
                      elements: state.data,
                      groupBy: (HistoryTemplate element) {
                        return TimeUtils.geDDMMYYYYFromTimeStamp(
                            element.dateTime ?? 0);
                      },
                      itemBuilder: (_, item) => HistoryItem(item: item),
                      groupHeaderBuilder: (element) => HistoryHeader(
                        item: element,
                      ),
                      groupSeparatorBuilder: (e) => sizedHeight08,
                    ),
                  );
                } else {
                  return LoadingErrorWidget();
                }
              },
            ),
            CommonButton(
              title: 'Load Data',
              onPress: () {
                context.read<HistoryCubit>().initialData();
              },
            )
          ],
        ));
  }
}
