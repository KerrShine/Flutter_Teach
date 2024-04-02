import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // 通知聽眾（Consumer）狀態已經改變
  }
}
