import 'action_builder.dart';
import 'instant.dart';
import 'ready_array.dart';

abstract class InstantBox {
  late int plyNum;

  ActionBuilder get actionBuilder;
  ReadyArray get readyArray;

  void incrementPly();

  Instant advance();
}
