import 'package:finance_app/managment/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/models/finance_model.dart';
import 'package:finance_app/pages/add_page.dart';
import 'package:finance_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: Dismissible(
        background: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: kSecondryYellow),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.edit,
              color: kPrimaryYellow,
            ),
          ),
        ),
        secondaryBackground: Container(
          decoration: BoxDecoration(color: kSecondaryRed),
          child: Align(
              alignment: Alignment.centerRight, child: Icon(Icons.delete,color: kPrimaryRed,),),
        ),
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPage(
                  isIncome: financeModel.financeValue > 0 ? true : false,
                  financeModel: financeModel,
                ),
              ),
            );
          } else if (direction == DismissDirection.endToStart) {
            financeModel.delete();
            BlocProvider.of<FetchDataCubit>(context).fetchData();
          }
        },
        key: UniqueKey(),
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
              Text(financeModel.financeValue > 0 ? '+' : ''),
              Text(financeModel.financeValue.toString())
            ],
          ),
        ),
      ),
    );
  }
}

