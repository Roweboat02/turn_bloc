import 'package:turn_bloc/package_external/action.dart';
import 'package:turn_bloc/package_external/action_builder.dart';

class DummyBuilder extends ActionBuilder {
  bool validActionVal;
  DummyBuilder(this.validActionVal);

  @override
  bool nextAction(Action action) {
    if (validActionVal) {
      stageNum++;
    }
    return validActionVal;
  }

  @override
  bool get prevCorrect => true;
}
