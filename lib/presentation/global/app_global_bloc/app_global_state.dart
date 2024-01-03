part of 'app_global_cubit.dart';

class AppGlobalState {
  List<MartialTemplate>? martialArts;
  MartialTemplate? martialArtSelected;

  AppGlobalState({this.martialArts, this.martialArtSelected});
  AppGlobalState copyWith({
    List<MartialTemplate>? martialArts,
    MartialTemplate? martialArtSelected,
  }) {
    return AppGlobalState(
      martialArts: martialArts ?? this.martialArts,
      martialArtSelected: martialArtSelected ?? this.martialArtSelected,
    );
  }
}
