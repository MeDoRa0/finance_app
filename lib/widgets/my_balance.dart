import 'package:finance_app/managment/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: kBlackColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                ),
              ),
              child: BlocBuilder<FetchDataCubit, FetchDataState>(
                builder: (context, state) {
                  if (state is FetchDataSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'My Balance',
                          style: TextStyle(color: kWhiteColor, fontSize: 20),
                        ),
                        Text(
                          //this to update my balance value
                          state.sum.toString(),
                          style: TextStyle(color: kWhiteColor),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
          Container(
            width: 80,
            decoration: BoxDecoration(
              color: kSecondaryPurple,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
