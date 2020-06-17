import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextInputType type;
  final String placeholder;
  final String helper;
  final String label;
  final bool filled;
  final Widget icon;
  final Widget prefix;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool dense;
  final double borderRadius;
  final FocusNode node;
  final Color helperColor;
  final Color fillColor;
  final TextInputAction actionNode;
  final Function onComplete, validator, onSubmit, onSaved, onChange;

  CustomField({
    Key key,
    this.type = TextInputType.text,
    this.placeholder = "",
    this.helper = "",
    this.label = "",
    this.filled,
    this.icon,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.prefix,
    this.dense = false,
    this.borderRadius = 5,
    this.node,
    this.actionNode,
    this.onComplete,
    this.onSubmit,
    this.onChange,
    this.onSaved,
    this.helperColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      focusNode: node,
      obscureText: type == TextInputType.visiblePassword ?? false,
      onChanged: onChange,
      onSaved: onSaved,
      onFieldSubmitted: onSubmit,
      onEditingComplete: onComplete,
      textInputAction: actionNode,
      validator: validator,
      decoration: InputDecoration(
        hintText: placeholder,
        helperText: helper,
        labelText: label,
        filled: filled,
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        prefix: prefix,
        prefixIcon: prefixIcon,
        icon: icon,
        isDense: dense,
        helperStyle: TextStyle(
          color: helperColor
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius)
        )
      )
    );
  }
}