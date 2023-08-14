// notification_provider.dart
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  int _notificationCount = 0;
  int _total = 0;

  int get notificationCount => _notificationCount;
  int? get total => _total;



  void incrementNotificationCount() async {
    _notificationCount++;
    _total++;
    notifyListeners();

  }

  void clearNotificationCount() {
    _notificationCount = 0;
    notifyListeners();
  }
}
