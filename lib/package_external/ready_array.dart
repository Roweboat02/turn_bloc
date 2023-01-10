class ReadyArray {
  final List<bool> _ready;

  List<bool> get ready => [..._ready];

  ReadyArray(this._ready);

  void clearReady() {
    for (var i = 0; i < _ready.length; i++) {
      _ready[i] = false;
    }
  }

  void setReady(int orderNum) {
    _ready[orderNum] = true;
  }

  bool isReady({int? plyNum}) {
    bool isready = true;
    if (plyNum == null) {
      for (int i = 0; i < _ready.length; i++) {
        isready &= _ready[i];
      }
    } else {
      isready = _ready[plyNum];
    }
    return isready;
  }
}
