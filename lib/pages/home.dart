import 'package:finance_app/widgets/add_minus_widget.dart';
import 'package:finance_app/widgets/my_balance.dart';
import 'package:finance_app/widgets/today.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('welcome, mohamed'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
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
                const Text('Activity'),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Text('see all'),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text('data'),
                            Text('data'),
                          ],
                        ),
                        Spacer(),
                        Text('+'),
                        Text('258.7')
                      ],
                    ),
                  ),
                );
              },
            ),)
          ],
        ),
      ),
    );
  }
}
