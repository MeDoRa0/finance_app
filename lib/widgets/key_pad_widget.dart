import 'package:flutter/material.dart';

class customKeyPad extends StatelessWidget {
  final String value;
  final ValueChanged<String> onValueChanged;

  customKeyPad({required this.value, required this.onValueChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  KeyPadItem(
                    num: '7',
                    onTap: () {
                      onValueChanged('${value}7');
                    },
                  ),
                  KeyPadItem(
                    num: '8',
                    onTap: () {
                      onValueChanged('${value}8');
                    },
                  ),
                  KeyPadItem(
                    num: '9',
                    onTap: () {
                      onValueChanged('${value}9');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  KeyPadItem(
                    num: '4',
                    onTap: () {
                      onValueChanged('${value}4');
                    },
                  ),
                  KeyPadItem(
                    num: '5',
                    onTap: () {
                      onValueChanged('${value}5');
                    },
                  ),
                  KeyPadItem(
                    num: '6',
                    onTap: () {
                      onValueChanged('${value}6');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  KeyPadItem(
                    num: '1',
                    onTap: () {
                      onValueChanged('${value}1');
                    },
                  ),
                  KeyPadItem(
                    num: '2',
                    onTap: () {
                      onValueChanged('${value}2');
                    },
                  ),
                  KeyPadItem(
                    num: '3',
                    onTap: () {
                      onValueChanged('${value}3');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  KeyPadItem(
                    num: '.',
                    onTap: () {
                      onValueChanged(value.contains('.') ? value : '$value.');
                    },
                  ),
                  KeyPadItem(
                    num: '0',
                    onTap: () {
                      onValueChanged('${value}0');
                    },
                  ),
                  KeyPadItem(
                    num: '<',
                    onTap: () {
                      onValueChanged(
                        value == '' ? value : value.substring(0, value.length - 1),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KeyPadItem extends StatelessWidget {
  final String num;
  final VoidCallback onTap;

  KeyPadItem({required this.num, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(4.0),
          color: Colors.grey[300],
          child: Center(
            child: Text(
              num,
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
      ),
    );
  }
}
