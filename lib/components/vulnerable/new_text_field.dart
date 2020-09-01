import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTextField extends StatefulWidget {
  String label;
  bool type;
  final Function(String) changeValue;
  final String value;
  final String theme;
  final double width;
  final String error;
  final TextInputType inputType;
  var controller;

  NewTextField({
    this.label,
    this.type,
    this.changeValue,
    this.value,
    this.theme,
    this.width,
    this.inputType,
    this.controller,
    @required this.error,
  });

  @override
  _NewTextFieldState createState() => _NewTextFieldState();
}

class _NewTextFieldState extends State<NewTextField> {
  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
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
    return Column(
      children: [
        SizedBox(
          width: widget.width != null ? widget.width : 320.0,
          height: 80.0,
          child: TextFormField(
            // controller: widget.controller,
            keyboardType: widget.inputType,
            style: eTextField,
            focusNode: focusNode,
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: widget.error.isNotEmpty
                  ? eLabelError
                  : focusNode.hasFocus ? eLabelFocused : eLabel,
              // labelStyle: widget.theme == null ? eLabel : eLabel,
              enabledBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  // color: Colors.black54,
                  color: widget.error.isNotEmpty ? Colors.red : Colors.black54,
                ),
              ),
              focusedBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: widget.error.isNotEmpty
                      ? Colors.red
                      : AppTheme.lightAccent,
                  width: 1.5,
                ),
              ),
            ),
            obscureText: widget.type,
            onChanged: (val) =>
                widget.changeValue != null ? widget.changeValue(val) : null,
          ),
        ),
      ],
    );
  }
}
