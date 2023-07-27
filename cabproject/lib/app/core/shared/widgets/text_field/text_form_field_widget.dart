import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? label;
  final bool autocorrect;
  final bool readOnly;
  final bool isEnabled;
  final FocusNode? focusNode;
  final bool autoFocus;
  final String? placeholder;
  final String? errorText;
  final String? hintText;
  final EdgeInsets? padding;
  final bool enableSuggestions;
  final bool obscureText;
  final Function(String?)? onChange;
  final Function()? onTap;
  final TextEditingController? controller;
  final int? maxLines;
  final int minLines;
  final Icon? iconData;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final Color? borderColor;
  final Color? cursorColor;
  final TextInputType? keyboardType;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final bool? showCursor;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextAlign? textAlign;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;

  const TextFormFieldWidget({
    Key? key,
    this.label,
    this.placeholder,
    this.errorText,
    this.hintText,
    this.focusNode,
    this.autoFocus = false,
    this.onSubmitted,
    this.validator,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.readOnly = false,
    this.isEnabled = true,
    this.controller,
    this.onChange,
    this.onTap,
    this.padding,
    this.maxLines = 1,
    this.iconData,
    this.prefixIcon,
    this.suffixIcon,
    this.minLines = 1,
    this.textInputAction,
    this.borderColor,
    this.cursorColor,
    this.keyboardType,
    this.showCursor = true,
    this.style,
    this.hintStyle,
    this.labelStyle,
    this.textAlign,
    this.suffix,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      showCursor: showCursor,
      onChanged: onChange,
      textInputAction: textInputAction,
      controller: controller,
      autofocus: autoFocus,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      style: style,
      textAlign: textAlign ?? TextAlign.left,
      cursorColor: cursorColor,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        errorStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: Colors.red,
              fontSize: 12,
            ),
        labelText: label,
        labelStyle: labelStyle ??
            TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
        suffix: suffix,
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
            ),
        prefixIcon: iconData,
        suffixIcon: suffixIcon,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
