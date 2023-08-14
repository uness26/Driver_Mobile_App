import 'package:flutter/material.dart';

class MissionCard extends StatefulWidget {
  const MissionCard(
      {Key? key,
      required this.id,
      required this.date,
      required this.depart,
      required this.destination})
      : super(key: key);
  final String id;
  final String date;
  final String depart;
  final String destination;

  @override
  State<MissionCard> createState() => _MissionCardState();
}

class _MissionCardState extends State<MissionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Card(
        color: Colors.indigo[400],
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.date,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.depart,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const Icon(Icons.arrow_downward),
                Text(
                  widget.destination,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
