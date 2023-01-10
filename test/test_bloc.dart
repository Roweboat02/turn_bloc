import 'package:turn_bloc/package_external/ready_array.dart';
import 'package:equatable/equatable.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:turn_bloc/game_bloc.dart';
import 'package:turn_bloc/package_external/instant.dart';
import 'dummy_box.dart';
import 'dummy_action_builder.dart';
import 'package:turn_bloc/package_external/action.dart';

part 'test_on_ready.dart';
part 'test_on_action_selected.dart';

void main() {
  group('Gamebloc onReady', testOnReady);
  group("GameBloc onActionSelected", testOnActionSelected);
}
