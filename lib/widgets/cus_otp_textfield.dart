import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CusOTPTxtfld extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool autofocus;
  const CusOTPTxtfld(
      {Key? key, required this.textEditingController, required this.autofocus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        controller: textEditingController,
        autofocus: autofocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColorDark,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            counterText: ' ',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
