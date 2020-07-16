import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Widget prefix;
  final Widget sufix;
  final bool obscure;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final bool enabled;
  final String errorText;

  const CustomTextField(
      {this.controller,
      this.hint,
      this.prefix,
      this.sufix,
      this.obscure = false,
      this.textInputType,
      this.onChanged,
      this.enabled,
      this.errorText = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          padding: prefix != null ? null : const EdgeInsets.only(left: 16),
          child: TextField(
            controller: controller,
            obscureText: obscure,
            onChanged: onChanged,
            enabled: enabled,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              prefixIcon: prefix,
              suffixIcon: sufix,
            ),
          ),
        ),
        Text(
          errorText,
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 10,
            fontStyle: FontStyle.italic,
          ),
        )
      ],
    );
  }
}
