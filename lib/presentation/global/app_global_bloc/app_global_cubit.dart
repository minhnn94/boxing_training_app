import 'package:boxing_traning/domain/models/martial_template.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_global_state.dart';

class AppGlobalCubit extends Cubit<AppGlobalState> {
  AppGlobalCubit() : super(AppGlobalState());
  void addNewMartialArt(MartialTemplate martial) {
    final data = state.martialArts ?? [];
    data.add(martial);
    emit(state.copyWith(martialArts: []));
    emit(state.copyWith(martialArts: data));
  }

  void updateMartialArt(MartialTemplate martialArtModel) {
    final data = getDataAfterUpdateItem(martialArtModel);
    emit(state.copyWith(martialArts: []));
    emit(state.copyWith(martialArts: data));
  }

  List<MartialTemplate> getDataAfterUpdateItem(
      MartialTemplate martialArtModel) {
    final data = state.martialArts ?? [];
    final indexOfItem = data.indexOf(martialArtModel);
    data[indexOfItem] = martialArtModel;
    return data;
  }
}
