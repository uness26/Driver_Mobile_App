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

    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          child: SizedBox(
            height: 80,
            child: Row(
              children: [
                const Icon(
                  Icons.circle_notifications_rounded,
                  size: 40,
                  color: Colors.grey,
                ),
                const SizedBox(width: 10),
                Expanded(child: Text( widget.message, style: const TextStyle(fontSize: 20))),
              ],
            ),
          )),
    );
  }
}
