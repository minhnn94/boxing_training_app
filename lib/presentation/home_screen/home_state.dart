part of 'home_cubit.dart';

class HomeState {
  List<MartialTemplate>? data;

  HomeState({this.data});
  HomeState copyWith({List<MartialTemplate>? data}) {
    return HomeState(data: data ?? this.data);
  }
}
