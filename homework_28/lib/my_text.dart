import 'package:flutter/material.dart';

class MyText1 extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Icon icon;
  final Widget icon1;
  final bool obscureText;

  const MyText1({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
    required this.icon1,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: icon,
          suffixIcon: icon1,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: const Color(0xFF343434),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label bosh bolmasligi kerak';
          } else if (value.length < 3) {
            return '$label 3ta harfdan kam bulmasin';
          } else if (value.length > 16) {
            return '$label 16ta harfdan kup bulmasin';
          }
          return null;
        },
      ),
    );
  }
}
