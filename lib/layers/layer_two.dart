import 'package:flutter/material.dart';

class LayerTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 584,
      decoration: BoxDecoration(
        color: Colors.white ,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60.0),
            bottomRight: Radius.circular(60.0),
        ),
      ),
    );
  }
}
