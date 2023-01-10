part of 'game_bloc.dart';

@immutable
abstract class GameState extends Equatable {
  get ready => null;
}

class AwaitInit extends GameState {
  final List<bool> ready;

  AwaitInit(this.ready);

  @override
  List<Object?> get props => [ready];
}

class AwaitAction extends GameState {
  final int orderNum;
  final int stage;
  final Action? action;
  final bool? correct;

  AwaitAction(this.orderNum, {this.stage = 0, this.action, this.correct});

  @override
  List<Object?> get props => [orderNum, stage, action, correct];
}

class ProcessingAction extends GameState {
  final int orderNum;
  final Instant newState;

  ProcessingAction(this.orderNum, this.newState);

  @override
  List<Object?> get props => [orderNum, newState];
}
