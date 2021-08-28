import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  final String first;
  final String second;

  CardDetails({@required this.first, @required this.second});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          first,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          second,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
