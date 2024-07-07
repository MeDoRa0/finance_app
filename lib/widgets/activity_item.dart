import 'package:finance_app/models/finance_model.dart';
import 'package:finance_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityItem extends StatelessWidget {
  final FinanceModel financeModel;
  const ActivityItem({
    super.key,
    required this.financeModel,
  });

  @override
  Widget build(BuildContext context) {
    // Create a date format instance
    final DateFormat formatter = DateFormat('d/MMMM/yyyy');

    // Format the date using the formatter
    final formattedDate = formatter.format(financeModel.date);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: financeModel.financeValue > 0
                  ? kSecondaryGreen
                  : kSecondaryOrange,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(financeModel.details),
                Text(formattedDate), // Display formatted date here
              ],
            ),
            const Spacer(),
            Text(financeModel.financeValue > 0 ? '+' : '-'),
            Text(financeModel.financeValue.toString())
          ],
        ),
      ),
    );
  }
}
