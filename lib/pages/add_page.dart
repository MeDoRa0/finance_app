import 'package:finance_app/styles/colors.dart';
import 'package:finance_app/widgets/cancel_button.dart';
import 'package:finance_app/widgets/custom_text_field.dart';
import 'package:finance_app/widgets/done_button.dart';
import 'package:finance_app/widgets/key_pad_widget.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key, required this.isIncome});
  final bool isIncome;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String value = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isIncome ? 'income' : 'Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextfield(
                    labelText: 'details..',
                    labelColor: kPrimaryPurple,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:
                          widget.isIncome ? kSecondaryGreen : kSecondaryOrange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        widget.isIncome
                            ? (value == '' ? '+ 0.0' : '+$value')
                            : (value == '' ? '- 0.0' : '-$value'),
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: widget.isIncome
                                ? kPrimaryGreen
                                : kPrimaryOrange),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            customKeyPad(
              value: value,
              onValueChanged: (newValue) {
                setState(() {
                  value = newValue;
                });
              },
            ),
            const Spacer(),
            const Row(
              children: [
                DoneButton(),
                SizedBox(
                  width: 16,
                ),
                CancelButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
