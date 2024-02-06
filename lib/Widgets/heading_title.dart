import 'package:flutter/material.dart';

class HeadingTitle extends StatelessWidget {
  final String title;

  const HeadingTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
            child: Text(title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5100E1))),
          ),
        ],
      ),
    );
  }
}
