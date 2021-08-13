import 'package:dfa/contents/colors.dart';
import 'package:dfa/contents/size_config.dart';
import 'package:flutter/material.dart';

Column TextArea(
    {TextInputType textInputType,
    TextStyle textStyle,
    Function onSaved,
    TextEditingController controller,
    String hintText,
    String titleText,
    Function onChanged,
    String errorText,
    Widget suffixWidget,
    bool obscureText = false,
    TextStyle errorStyle,
    TextStyle labelStyle,
    bool noError = true,
    bool filled = false,
    int maxLines = 1,
    Color borderColor,
    Color activeBorderColor,
    double radius = 5,
    TextStyle hintStyle,
    bool enabled = true,
    TextAlign textAlign = TextAlign.start}) {
  return Column(
    children: <Widget>[
      TextFormField(
        enabled: enabled,
        textAlign: textAlign,
        maxLines: maxLines,
        obscureText: obscureText,
        keyboardType: textInputType,
        onSaved: onSaved,
        style: textStyle,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          labelText: titleText,
          labelStyle: labelStyle,
          prefix: Wrap(
            children: <Widget>[SizeConfig.largeHorizontalBox],
          ),
          hintText: hintText,
          hintStyle: hintStyle,
          filled: filled,
          fillColor: ThemeColor.blueGreyColor.withOpacity(0.16),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: activeBorderColor, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(radius))),
        ),
      ),
      noError ? SizedBox() : Text(errorText, style: errorStyle),
    ],
  );
}
