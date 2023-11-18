// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class NotificationCard extends StatefulWidget {
  final String message;

  const NotificationCard({required this.message, Key? key}) : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        shadowColor: Colors.black,
        color: Colors.blueGrey[100]?.withOpacity(1),
        child: SizedBox(
          height: 80,
          child: Row(
            children: [
              const Icon(
                Icons.circle_notifications_rounded,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Text(widget.message,
                      style: const TextStyle(fontSize: 20))),
            ],
          ),
        ));
  }
}
