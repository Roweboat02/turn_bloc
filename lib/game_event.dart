part of 'game_bloc.dart';

@immutable
abstract class GameEvent {}

class Ready extends GameEvent {
  int orderNum;
  Ready(this.orderNum);
}

class ActionSelected extends GameEvent {
  final Action action;

  ActionSelected(this.action);
}
