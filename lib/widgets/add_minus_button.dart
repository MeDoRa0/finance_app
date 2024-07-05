import 'package:flutter/material.dart';

class AddMinusButton extends StatelessWidget {
  const AddMinusButton({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.textColor,
    required this.color,
    required this.onTap,
  });
  final String text;
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
