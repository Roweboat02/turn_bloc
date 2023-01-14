part of 'bloc_test.dart';

void testOnActionSelected() {
  Action emptyAct = Action(0, [], []);
  blocTest<GameBloc, GameState>(
    "action invalid",
    build: () => GameBloc(DummyBox(3, actbuild: DummyBuilder(false))),
    seed: () => AwaitAction(
      0,
      stage: 0,
    ),
    act: (bloc) => bloc..add(ActionSelected(emptyAct)),
    expect: () => [AwaitAction(0, stage: 0, action: emptyAct, correct: true)],
  );

  blocTest<GameBloc, GameState>(
    "action valid",
    build: () => GameBloc(DummyBox(3, actbuild: DummyBuilder(true))),
    seed: () => AwaitAction(0, stage: 0),
    act: (bloc) => bloc..add(ActionSelected(Action(0, [], []))),
    expect: () => [ProcessingAction(0, Instant())],
  );
}
