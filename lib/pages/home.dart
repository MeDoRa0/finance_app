import 'package:finance_app/pages/all_activity.dart';
import 'package:finance_app/widgets/activity_item.dart';
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
        title: const Text('Welcome, Mohamed'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
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
                        builder: (context) => AllActivityPage(),
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
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ActivityItem();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

