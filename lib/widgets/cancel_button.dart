import 'package:finance_app/managment/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: kSecondaryRed,
          foregroundColor: kPrimaryRed,
          padding: const EdgeInsets.all(20),
        ),
        onPressed: () {
          BlocProvider.of<FetchDataCubit>(context).fetchData();
          Navigator.pop(context);
        },
        child: const Text('Camcel'),
      ),
    );
  }
}
