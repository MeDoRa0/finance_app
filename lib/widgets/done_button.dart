import 'package:finance_app/managment/add_data_cubit/add_data_cubit.dart';
import 'package:finance_app/managment/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/models/finance_model.dart';
import 'package:finance_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoneButton extends StatelessWidget {
  final TextEditingController detailsCont;
  final String value;
  final bool isIncome;
  final FinanceModel? financeModel;

  const DoneButton({
    super.key,
    required this.detailsCont,
    required this.value,
    required this.isIncome,
    this.financeModel,
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
            if (financeModel != null) {
              financeModel!.details = detailsCont.text;
              //check if isIncome is true get the value as it is,
              financeModel!.financeValue = isIncome
                  ? double.parse(value)
                  //if false ,check if the value is less than 0 get the value as it is
                  : double.parse(value) < 0
                      ? double.parse(value)
                      //if greater than 0 Multiply the value by -1.

                      : double.parse(value) * -1;
              financeModel!.save();
            } else {
              BlocProvider.of<AddDataCubit>(context).addData(
                FinanceModel(
                  details: detailsCont.text,
                  // parse to convert value to double
                  financeValue:
                      isIncome ? double.parse(value) : double.parse(value) * -1,
                  date: DateTime.now(),
                ),
              );
            }
            print("Data added successfully.");
            BlocProvider.of<FetchDataCubit>(context).fetchData();
            BlocProvider.of<FetchDataCubit>(context).fetchDateDate(
                dateTime:
                    BlocProvider.of<FetchDataCubit>(context).selectedTime);
            Navigator.pop(context);
          } on Exception catch (e) {
            print("Error: $e");
          }
        },
        child: Text(financeModel != null ? 'Save' : 'Add'),
      ),
    );
  }
}