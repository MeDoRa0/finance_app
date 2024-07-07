import 'package:finance_app/managment/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/models/finance_model.dart';
import 'package:finance_app/pages/all_activity.dart';
import 'package:finance_app/widgets/activity_item.dart';
import 'package:finance_app/widgets/add_minus_widget.dart';
import 'package:finance_app/widgets/my_balance.dart';
import 'package:finance_app/widgets/today.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  //when home page open get the data by using fetchdata cubit
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FetchDataCubit>(context).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, Mohamed'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocBuilder<FetchDataCubit, FetchDataState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: state is FetchDataLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      const MyBalance(),
                      const SizedBox(
                        height: 20,
                      ),
                      const TodayBox(),
                      const SizedBox(
                        height: 16,
                      ),
                      const AddMinusWidget(),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Activities',
                            style: TextStyle(fontSize: 18),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AllActivityPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'See All',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: BlocProvider.of<FetchDataCubit>(context)
                              .finanacList
                              .length,
                          itemBuilder: (context, index) {
                            List<FinanceModel> myList = BlocProvider.of<
                                    FetchDataCubit>(context)
                                .finanacList
                                .reversed
                                .toList(); //reversed so it show the last value on top
                            return ActivityItem(
                              financeModel: myList[index],
                            );
                          },
                        ),
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}
