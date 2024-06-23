import 'package:finance_app/styles/colors.dart';
import 'package:flutter/material.dart';

class PageItem extends StatelessWidget {
  final String title;
  final String image;
  final String subtitle;
  const PageItem({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image),
        Text(
          title,
          style: TextStyle(
            color: kPrimaryGreen,
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(subtitle),
      ],
    );
  }
}
