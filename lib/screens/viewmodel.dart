import 'package:flutter/foundation.dart';
//-----------------------------------------------
// Don't change this file!
//-----------------------------------------------

class Viewmodel with ChangeNotifier {
  bool _busy = false;

  get busy => _busy;

  void turnBusy() {
    _busy = true;
  }

  void turnIdle() {
    _busy = false;
    notifyListeners();
  }

  // A convenient method, to implicitly write the turnBusy()... turnIdle()
  void update(AsyncCallback fn) async {
    turnBusy();
    await fn();
    turnIdle();
  }
}
