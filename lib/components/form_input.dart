import 'package:covidhelper_v2/components/text_field.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  String label;
  bool type;
  final Function(String) changeValue;
  final String value;

  FormInput({this.label, this.type, this.changeValue, this.value});

  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 320.0,
          height: 100.0,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: AppTheme.darkTheme.textTheme.subtitle1,
            ),
            obscureText: widget.type,
            initialValue: widget.value != null ? widget.value : '',
            validator: (val) => val.isEmpty ? 'This field is required' : '',
            onChanged: (val) => widget.changeValue(val),
          ),
        ),
      ],
    );
  }

}
