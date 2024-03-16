import 'package:flutter/material.dart';

class LoveTextField extends StatelessWidget {
  final String Placeholder;
  final double Wsize;
  final bool? isObscured;
  final Widget? icono;
  final TextEditingController? controller;
  final Color ? textColor;

  const LoveTextField(
      {super.key,
      this.isObscured,
      required this.Placeholder,
      this.icono,
      required this.Wsize,
      this.controller,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Wsize,
      child: TextField(
        controller: controller,
        obscureText: isObscured ?? false,
        decoration: InputDecoration(
          prefixIcon: icono ?? const Icon(null),
          border: const OutlineInputBorder(),
          labelText: Placeholder,
        ),
        style: TextStyle(color: textColor),
      ),
    );
  }
}
