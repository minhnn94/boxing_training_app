import 'package:bloc/bloc.dart';
import 'package:boxing_traning/models/martial_art_model.dart';
import 'package:boxing_traning/models/martial_template.dart';

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
