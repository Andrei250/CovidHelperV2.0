import 'package:covidhelper_v2/models/vendor.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  final TextInputType inputType;
  final String label;
  final bool passwordText;


  InputTextField({ this.inputType, this.label, this.passwordText });

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  FocusNode focusNode = new FocusNode();
  String value;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(onOnFocusNodeEvent);
  }

  onOnFocusNodeEvent() {
    setState(() {});
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = InheritedModel.inheritFrom<Vendor>(context, aspect: 'one');
    return Scaffold(
      body: TextFormField(
        obscureText: widget.passwordText,
        keyboardType: widget.inputType,
        focusNode: focusNode,
        style: AppTheme.darkTheme.textTheme.subtitle1,
        cursorColor: AppTheme.lightColor,
        decoration: new InputDecoration(
          labelText: '${widget.label}',
          labelStyle: focusNode.hasFocus ? eLabelFocused : eLabel,
        ),
        onChanged: (val) {
          setState(() => value = val);
          print(value);
        },
      ),
    );
  }
}
