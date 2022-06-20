import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:lifetimer/presentation/widgets/snack_bar.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(life: 0, timer: 0, stop: false));

//<
  Future<void> startTimer(BuildContext context) async {
    emit(state.copyWith(stop: false));
    appSnack(context, "Timer Start");
    while (true) {
      if (state.stop == true) {
        break;
      }
      await Future.delayed(const Duration(seconds: 1));

      emit(state.copyWith(timer: state.timer! + 1));

      if (((state.timer! % 5) == 0) && state.timer != 0) {
        emit(state.copyWith(life: state.life! + 1));
      }
    }
  }

// <
  void timerStop(BuildContext context) {
    emit(state.copyWith(stop: true));
    appSnack(context, "Timer Stopped");
  }

//<
  void timerReset(BuildContext context) {
    emit(state.copyWith(life: 0, timer: 0, stop: false));
    appSnack(context, "Timer Reset");
  }
}
