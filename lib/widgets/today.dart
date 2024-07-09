import 'package:finance_app/managment/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodayBox extends StatelessWidget {
  const TodayBox({
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
                  bottomLeft: Radius.circular(12),
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
                          'Today Balance',
                          style: TextStyle(color: kWhiteColor, fontSize: 20),
                        ),
                        Text(
                          state.todaySum.toString(),
                          style: TextStyle(color: kWhiteColor, fontSize: 16),
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
              color: kSecondaryRed,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
