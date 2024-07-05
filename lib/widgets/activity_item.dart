import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
