part of "bloc_test.dart";

void testOnReady() {
  blocTest(
    'Empty AwaitInit when started',
    build: () => GameBloc(DummyBox(3)),
    expect: () => [],
  );

  blocTest(
    'AwaitInit 0 ready',
    build: () => GameBloc(DummyBox(3)),
    act: (bloc) => bloc.add(Ready(0)),
    expect: () => [
      AwaitInit(const [true, false, false])
    ],
  );

  blocTest(
    'AwaitInit 0 ready twice',
    build: () => GameBloc(DummyBox(3)),
    act: (bloc) => bloc
      ..add(Ready(0))
      ..add(Ready(0)),
    expect: () => [
      AwaitInit(const [true, false, false]),
    ],
  );

  blocTest(
    'AwaitInit 2 and 0 ready',
    build: () => GameBloc(DummyBox(3)),
    act: (bloc) => bloc
      ..add(Ready(0))
      ..add(Ready(2)),
    expect: () => [
      AwaitInit(const [true, false, false]),
      AwaitInit(const [true, false, true]),
    ],
  );
  blocTest(
    'AwaitInit all ready',
    build: () => GameBloc(DummyBox(3)),
    act: (bloc) => bloc
      ..add(Ready(0))
      ..add(Ready(1))
      ..add(Ready(2)),
    expect: () => [
      AwaitInit(const [true, false, false]),
      AwaitInit(const [true, true, false]), // AwaitInit is never remitted!
      AwaitAction(0), // State to AwaitAction when all ready!
    ],
  );
  blocTest<GameBloc, GameState>(
    'ProcessingAction',
    build: () => GameBloc(DummyBox(3)),
    seed: () => ProcessingAction(0, Instant()),
    act: (bloc) => bloc
      ..add(Ready(1))
      ..add(Ready(0)),
    expect: () => [
      AwaitAction(0), // State to AwaitAction when all ready!
    ],
  );
}
