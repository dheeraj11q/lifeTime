part of 'home_cubit.dart';

class HomeState extends Equatable {
  final int? life;
  final int? timer;
  final bool? stop;

  const HomeState({this.life, this.timer, this.stop});

  HomeState copyWith({int? life, int? timer, bool? stop}) {
    return HomeState(
        life: life ?? this.life,
        timer: timer ?? this.timer,
        stop: stop ?? this.stop);
  }

  @override
  List<Object> get props => [life!, timer!, stop!];
}
