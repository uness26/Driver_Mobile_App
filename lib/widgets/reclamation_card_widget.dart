import 'package:flutter/material.dart';

class ReclamationCard extends StatefulWidget {
  const ReclamationCard({Key? key,
    required this.id,
    required this.date,
    required this.type,
    required this.etat})
      : super(key: key);
  final String id;
  final String date;
  final String type;
  final String etat;

  @override
  State<ReclamationCard> createState() => _ReclamationCardState();
}

class _ReclamationCardState extends State<ReclamationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
          color: Colors.indigo[400],
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),                elevation: 10,
          shadowColor: Colors.black,
          child: Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.date,
                    style:
                    const TextStyle(color: Colors.white, fontSize: 20)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( widget.type,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                    Text(widget.etat,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                ),

              ],

            ),
          )),
    );
  }
}
