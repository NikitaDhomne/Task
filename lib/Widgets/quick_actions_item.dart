import 'package:flutter/material.dart';

class QuickActionsItem extends StatelessWidget {
  final String title;
  final String icondata;

  QuickActionsItem(this.title, this.icondata);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;
    var screenWidth = mediaQuery.size.width;
    return Container(
      height: screenHeight * 0.08,
      width: screenWidth * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
            ),
            Container(
                margin: EdgeInsets.only(left: 16, top: 10),
                height: 40,
                color: Colors.transparent,
                child: Image.asset(
                  icondata,
                  fit: BoxFit.contain,
                ))
          ]),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }
}
