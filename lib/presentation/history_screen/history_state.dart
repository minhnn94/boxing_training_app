part of 'history_cubit.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoadingError extends HistoryState {}

class HistoryLoadingSuccess extends HistoryState {
  final List<HistoryTemplate> data;

  HistoryLoadingSuccess(this.data);
}
