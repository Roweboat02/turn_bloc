import 'package:turn_bloc/package_external/instant.dart';
import 'package:turn_bloc/package_external/action_builder.dart';
import 'package:turn_bloc/package_external/instant_box.dart';
import 'package:turn_bloc/package_external/ready_array.dart';

class DummyBox extends InstantBox {
  late List<bool> ready;
  ActionBuilder? actbuild;

  DummyBox(int size, {this.actbuild}) {
    ready = List.generate(size, (index) => false);
    plyNum = 0;
  }

  @override
  ActionBuilder get actionBuilder => actbuild!;

  @override
  Instant advance() {
    return Instant();
  }

  @override
  void incrementPly() {}

  @override
  ReadyArray get readyArray => ReadyArray(ready);
}
