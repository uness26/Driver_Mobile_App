// ignore_for_file: avoid_print, library_prefixes

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../providers/notification_provider.dart';
import '../providers/user_provider.dart';
import 'config.dart';
import 'utils.dart';

class SocketManager {
  static IO.Socket? _socket;

  static Future<void> initSocket(BuildContext context) async {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    final token = await FirebaseMessaging.instance.getToken();
    try {
      _socket = IO.io(url, <String, dynamic>{
        "transports": ["websocket"],
        "autoConnect": false,
      });

      _socket!.connect();
      _socket!.onConnect((data) {
        print('Connected to the server: ${_socket!.id}');
        _socket!.emit("joinRoom", {
          "chauffeurID": userProvider.user.id.toString(),
          "matricule": userProvider.user.matricule.toString(),
          "fcm_token": token.toString()
        });
      });

      _socket!.on("addMission", (data) {
        print(data);
        Provider.of<NotificationProvider>(context, listen: false)
            .incrementNotificationCount();
        showNotification(context, data);
      });

      _socket!.on("editEtat", (data) {
        Provider.of<NotificationProvider>(context, listen: false)
            .incrementNotificationCount();
        showNotification(context, data);
      });

      _socket!.onDisconnect((_) => print('Connection Disconnection'));
    } catch (e) {
      print(e.toString());
    }
  }

  static IO.Socket? get socket => _socket;
}
