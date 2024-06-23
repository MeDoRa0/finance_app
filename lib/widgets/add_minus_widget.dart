import 'package:finance_app/styles/colors.dart';
import 'package:finance_app/widgets/add_minus_button.dart';
import 'package:flutter/material.dart';

class AddMinusWidget extends StatelessWidget {
  const AddMinusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AddMinusButton(
            text: 'plus',
            icon: Icons.add,
            iconColor: kPrimaryGreen,
            textColor: kPrimaryGreen,
            color: kSecondaryGreen),
        const SizedBox(
          width: 10,
        ),
        AddMinusButton(
            text: 'minus',
            icon: Icons.remove,
            iconColor: kPrimaryRed,
            textColor: kPrimaryRed,
            color: kSecondaryRed),
      ],
    );
  }
}
