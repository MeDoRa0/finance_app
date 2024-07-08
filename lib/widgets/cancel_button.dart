import 'package:finance_app/styles/colors.dart';
import 'package:flutter/material.dart';

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
          padding: EdgeInsets.all(20),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Camcel'),
      ),
    );
  }
}
