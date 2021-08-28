import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  final String first;
  final String second;

  OrderList({@required this.first, @required this.second});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            first,
            style: TextStyle(
              fontSize: 19,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "x" + second,
            style: TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
