import 'action.dart';

abstract class ActionBuilder {
  int stageNum = 0;
  bool get prevCorrect;
  bool nextAction(Action action);
}
