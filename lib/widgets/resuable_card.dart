import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  ReusableCard({
    @required this.cardChild,
    @required this.onPress,
    this.colour,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        child: cardChild,
        onTap: onPress,
      ),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: this.colour, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
