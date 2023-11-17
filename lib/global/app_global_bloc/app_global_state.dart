part of 'app_global_cubit.dart';

class AppGlobalState {
  List<MartialArtModel>? martialArts;
  MartialArtModel? martialArtSelected;

  AppGlobalState({this.martialArts, this.martialArtSelected});
  AppGlobalState copyWith({
    List<MartialArtModel>? martialArts,
    MartialArtModel? martialArtSelected,
  }) {
    return AppGlobalState(
      martialArts: martialArts ?? this.martialArts,
      martialArtSelected: martialArtSelected ?? this.martialArtSelected,
    );
  }
}
