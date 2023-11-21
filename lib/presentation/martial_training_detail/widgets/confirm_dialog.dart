import 'package:boxing_traning/common/app_localization_utils.dart';
import 'package:boxing_traning/common/text_style_utils.dart';
import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.martial,
  });
  final MartialTemplate martial;
  @override
  Widget build(BuildContext context) {
    final translation = AppLocalizationUtils.instance();
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Builder(
        builder: (context) {
          double dialogHeight = 300;
          var width = MediaQuery.of(context).size.width;

          return Container(
            height: dialogHeight,
            width: width,
            child: Column(
              children: [
                Text(
                  translation.doYouWantToDeleteSport(martial.name ?? ''),
                  style: TextStyleUtils.text16Weight600,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
