import 'package:finance_app/managment/add_data_cubit/add_data_cubit.dart';
import 'package:finance_app/models/finance_model.dart';
import 'package:finance_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoneButton extends StatelessWidget {
  final TextEditingController detailsCont;
  final String value;
  final bool isIncome;

  const DoneButton({
    super.key,
    required this.detailsCont,
    required this.value,
    required this.isIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: kSecondaryBlue,
          foregroundColor: kPrimaryBlue,
          padding: const EdgeInsets.all(20),
        ),
        onPressed: () {
          try {
            BlocProvider.of<AddDataCubit>(context).addData(
              FinanceModel(
                details: detailsCont.text,
                // parse to convert value to double
                financeValue:
                    isIncome ? double.parse(value) : double.parse(value) * -1,
                date: DateTime.now(),
              ),
            );
            print("Data added successfully.");
            Navigator.pop(context);
          } on Exception catch (e) {
            print("Error: $e");
          }
        },
        child: const Text('Done'),
      ),
    );
  }
}
