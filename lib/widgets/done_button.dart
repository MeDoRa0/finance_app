
import 'package:finance_app/styles/colors.dart';
import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({
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
          backgroundColor: kSecondaryBlue,
          foregroundColor: kPrimaryBlue,
          padding: EdgeInsets.all(20),
        ),
        onPressed: () {},
        child: Text('Done'),
      ),
    );
  }
}
