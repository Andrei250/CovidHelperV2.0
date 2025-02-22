import 'package:covidhelper_v2/components/text_field.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  String label;
  bool type;
  final Function(String) changeValue;
  final String value;
  final String theme;
  final double width;

  FormInput({this.label,
            this.type,
            this.changeValue,
            this.value,
            this.theme,
            this.width});

  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.width != null ? widget.width : 320.0,
          height: 100.0,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: widget.theme == null ? AppTheme.darkTheme.textTheme.subtitle1 : AppTheme.lightTheme.textTheme.subtitle1,
            ),
            obscureText: widget.type,
            initialValue: widget.value != null ? widget.value : '',
            validator: (val) => val.isEmpty ? 'Camp obligatoriu' : '',
            onChanged: (val) => widget.changeValue != null ? widget.changeValue(val) : null,
          ),
        ),
      ],
    );
  }

}
