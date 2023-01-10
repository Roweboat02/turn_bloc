import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package_external/action_builder.dart';
import 'package_external/instant_box.dart';
import 'package_external/ready_array.dart';
import 'package_external/action.dart';
import 'package_external/instant.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  /*
  Assumes:
  players have a bool ready, auto set to false.
  players who should be authenticated are authenticated
  States which need to be broadcasted to all:
    ProcessingAction & AwaitInit
  */

  InstantBox box;

  GameBloc(this.box) : super(AwaitInit(const [])) {
    /* 
        allReady=true => all players must be ready
        */

    on<Ready>(onReady);
    on<ActionSelected>(onActionSelected);
  }

  void onReady(event, emit) {
    /* 
    set ready player to true
    If AwaitInit and all players are ready, go to AwaitAction
    If ProcessingAction and next player is ready, go to AwaitAction

    Else if AwaitInit, rebroadcast all who've readied
    */
    ReadyArray readyArr = box.readyArray;
    bool isInit = state is AwaitInit;
    readyArr.setReady(event.orderNum);
    if ((isInit && readyArr.isReady()) ||
        state is ProcessingAction && readyArr.isReady(plyNum: box.plyNum)) {
      emit(AwaitAction(box.plyNum));
      readyArr.clearReady();
    } else if (isInit) {
      emit(AwaitInit(readyArr.ready));
    }
  }

  void onActionSelected(event, emit) {
    /*
    Checks validity of action. 
    valid => emit processing, advance game, increment turnNum
    not => await action
    */
    ActionBuilder ab = box.actionBuilder;
    if (ab.nextAction(event.action)) {
      emit(ProcessingAction(box.plyNum, box.advance()));
    } else {
      emit(AwaitAction(box.plyNum,
          stage: ab.stageNum, action: event.action, correct: ab.prevCorrect));
    }
  }
}
