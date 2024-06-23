import 'package:finance_app/styles/colors.dart';
import 'package:flutter/material.dart';

class MyBalance extends StatelessWidget {
  const MyBalance({
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
                  topLeft: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'My Balance',
                    style: TextStyle(color: kWhiteColor),
                  ),
                  Text('536.5', style: TextStyle(color: kWhiteColor)),
                ],
              ),
            ),
          ),
          Container(
            width: 80,
            decoration: BoxDecoration(
              color: kSecondaryPurple,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
