import 'dart:async';

import 'package:bloc/bloc.dart';

part 'timing_state.dart';

class TimingCubit extends Cubit<TimingState> {
  TimingCubit() : super(TimingState());
  Timer? _timer;
  void onInit() {}
  void onDispose() {}
}
