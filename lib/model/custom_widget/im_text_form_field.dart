import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:im_app_student/model/constants.dart';

class IMTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? labelText;
  final String? helperText;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final IconData? iconData;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final Function()? suffixOnTap;
  final String? Function(String?)? validator;
  final Color? suffixIconColor;
  final TextInputType? keyboardType;
  final bool number;
  final bool isObscure;
  final int maxLines;

  const IMTextFormField({
    Key? key,
    this.textEditingController,
    this.focusNode,
    this.onChanged,
    this.onSaved,
    this.labelText,
    this.helperText,
    this.iconData,
    this.prefixIconData,
    this.suffixIconData,
    this.suffixOnTap,
    this.hintText,
    this.hintTextStyle,
    this.validator,
    this.suffixIconColor,
    this.keyboardType,
    this.isObscure = false,
    this.number = false,
    this.onTap,
    this.onFieldSubmitted,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: textEditingController,
      focusNode: focusNode,
      obscureText: isObscure,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType,
      inputFormatters: number
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : null,
      style: IMTextStyle.testFormLettering,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Color(0xFFE5E5E5),
        icon: iconData != null ? Icon(iconData) : null,
        labelText: labelText,
        labelStyle: IMTextStyle.testFormLettering,
        isDense: true,
        helperText: helperText,
        hintText: hintText,
        hintStyle: IMTextStyle.testFormLettering,
        prefixIcon: prefixIconData != null
            ? Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 10.0),
                child: Icon(
                  prefixIconData,
                  color: IMColors.primaryColor,
                  size: 25,
                ),
              )
            : null,
        suffixIcon: suffixIconData != null
            ? GestureDetector(
                onTap: suffixOnTap,
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Icon(
                    suffixIconData,
                    color: suffixIconColor,
                    size: 25,
                  ),
                ),
              )
            : null,
      ),
      validator: validator,
    );
  }
}
