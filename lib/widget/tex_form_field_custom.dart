import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    this.controller,
    this.padding,
    this.hintText,
    this.labelText,
    this.validator,
    this.helperText, this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      validator: widget.validator,

      //keyboardType: widget.emailType,
      decoration: InputDecoration(
        helperMaxLines: 3,

        labelText: widget.labelText,
        hintText: widget.hintText,
        focusedBorder: defaultBorder,
        //coloca uma cor na borda e no texto de aviso em caso de error
        errorBorder: defaultBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red),

        ),
        focusedErrorBorder: defaultBorder,
        enabledBorder: defaultBorder,
        disabledBorder: defaultBorder,
        helperText: widget.helperText,
      ),
    );
  }
}
