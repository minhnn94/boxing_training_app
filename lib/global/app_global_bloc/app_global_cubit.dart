import 'package:bloc/bloc.dart';
import 'package:boxing_traning/models/martial_art_model.dart';

part 'app_global_state.dart';

class AppGlobalCubit extends Cubit<AppGlobalState> {
  AppGlobalCubit() : super(AppGlobalState());
  void updateMartialArt(MartialArtModel martialArtModel) {}
  void addNewMartialArt(MartialArtModel martialArtModel) {
    final data = state.martialArts ?? [];
    data.add(martialArtModel);
    emit(state.copyWith(martialArts: []));
    emit(state.copyWith(martialArts: data));
  }
}
