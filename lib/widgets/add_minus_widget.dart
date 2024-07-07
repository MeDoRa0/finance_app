import 'package:finance_app/pages/add_page.dart';
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
          text: 'Income',
          icon: Icons.add,
          iconColor: kPrimaryGreen,
          textColor: kPrimaryGreen,
          color: kSecondaryGreen,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPage(
                isIncome: true,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        AddMinusButton(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPage(
                isIncome: false,
              ),
            ),
          ),
          text: 'Expense',
          icon: Icons.remove,
          iconColor: kPrimaryOrange,
          textColor: kPrimaryOrange,
          color: kSecondaryOrange,
        ),
      ],
    );
  }
}
