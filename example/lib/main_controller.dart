import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class MainController {
  int _pushQuantity = 0;
  final onStreamEvent = BehaviorSubject<int>.seeded(0);
  final onNotifierEvent = ValueNotifier<int>(0);

  void increaseQuantity() {
    _pushQuantity++;
    onStreamEvent.add(_pushQuantity);
    onNotifierEvent.value = _pushQuantity;
  }

  void dispose() {
    onStreamEvent.close();
    onNotifierEvent.dispose();
  }
}
