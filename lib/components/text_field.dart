import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  final TextInputType inputType;
  final String label;
  final bool passwordText;
  final Function(String) changeValue;
  final String errorText;

  InputTextField(
      {this.inputType,
      this.label,
      this.passwordText,
      this.changeValue,
      this.errorText});

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
//    final user = InheritedModel.inheritFrom<Vendor>(context, aspect: 'one');

    String _name;

    return Scaffold(
      backgroundColor: Colors.white,
        body: Column(
      children: <Widget>[
        SizedBox(
          child: TextFormField(
            autofocus: true,
            obscureText: widget.passwordText,
            keyboardType: widget.inputType,
            focusNode: focusNode,
            style: eTextField,
            cursorColor: AppTheme.lightAccent,
            decoration: new InputDecoration(
              labelText: '${widget.label}',
              labelStyle: widget.errorText != null
                  ? eLabelError
                  : focusNode.hasFocus ? eLabelFocused : eLabel,
              enabledBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: widget.errorText != null
                      ? Colors.red
                      : Colors.black54,
                ),
              ),
              focusedBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: widget.errorText != null
                      ? Colors.red
                      : AppTheme.lightAccent,
                  width: 1.5,
                ),
              ),
            ),
            onChanged: (val) => widget.changeValue(val),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
            child: Text(
              widget.errorText == null ? '' : widget.errorText,
              style: eWarning,
            ),
          ),
        ),
      ],
    ));
  }
}
