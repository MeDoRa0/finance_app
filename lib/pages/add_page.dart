import 'package:finance_app/managment/add_data_cubit/add_data_cubit.dart';
import 'package:finance_app/models/finance_model.dart';
import 'package:finance_app/styles/colors.dart';
import 'package:finance_app/widgets/cancel_button.dart';
import 'package:finance_app/widgets/custom_text_field.dart';
import 'package:finance_app/widgets/done_button.dart';
import 'package:finance_app/widgets/key_pad_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPage extends StatefulWidget {
  AddPage({super.key, required this.isIncome, this.financeModel});
  final bool isIncome;
  FinanceModel? financeModel;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController detailsCont = TextEditingController();

  String value = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.financeModel != null) {
      setState(
        () {
          detailsCont.text = widget.financeModel!.details;

          value = widget.financeModel!.financeValue < 0
              ? (widget.financeModel!.financeValue * -1).toString()
              : (widget.financeModel!.financeValue).toString();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isIncome ? 'income' : 'Expense'),
      ),
      //provide AddDataCubit to the add page;
      body: BlocProvider(
        create: (context) => AddDataCubit(),
        child: BlocBuilder<AddDataCubit, AddDataState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextfield(
                          labelText: 'details..',
                          labelColor: kPrimaryPurple,
                          controller: detailsCont,
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
                            color: widget.isIncome
                                ? kSecondaryGreen
                                : kSecondaryOrange,
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
                  Row(
                    children: [
                      DoneButton(
                        detailsCont: detailsCont,
                        value: value,
                        isIncome: widget.isIncome,
                        financeModel: widget.financeModel,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const CancelButton(),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
