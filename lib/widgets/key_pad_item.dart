import 'package:finance_app/styles/colors.dart';
import 'package:flutter/material.dart';

class KeyPadItem extends StatelessWidget {
  final String num;
  final Function() onTap;
  const KeyPadItem({
    super.key,
    required this.num,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: kBlackColor, borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                num,
                style: TextStyle(
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
