import 'package:boxing_traning/common/global/global_key.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppLocalizationUtils {
  static final context = navigatorKey.currentContext;
  static AppLocalizations instance() {
    if (context != null) {
      final instance = AppLocalizations.of(context!);
      if(instance!=null) {
        return AppLocalizations.of(context!)!;
      }else{
        throw Exception('App Localization of currentContext is Null');
      }
    } else {
      throw Exception('The currentContext is Null');
    }
  }
}
