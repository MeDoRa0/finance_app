import 'package:finance_app/styles/colors.dart';
import 'package:flutter/material.dart';

class TodayBox extends StatelessWidget {
  const TodayBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: kBlackColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(color: kWhiteColor),
                  ),
                  Text('34.4', style: TextStyle(color: kWhiteColor)),
                ],
              ),
            ),
          ),
          Container(
            width: 80,
            decoration: BoxDecoration(
              color: kSecondaryRed,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
