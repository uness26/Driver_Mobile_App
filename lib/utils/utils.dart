import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/notification_card_widget.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 201:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, response.body);
  }
}

void showNotification(BuildContext context, String message) {
  final overlay = Overlay.of(context);

  if (!context.findRenderObject()!.attached) {
    return;
  }

  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 25.0,
      right: 16.0,
      left: 16,
      child: NotificationCard(message: message)
    ),
  );

  overlay.insert(overlayEntry);
  Future.delayed(const Duration(seconds: 10), () => overlayEntry.remove());
}
