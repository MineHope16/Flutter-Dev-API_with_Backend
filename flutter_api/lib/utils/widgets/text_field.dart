import 'package:flutter/material.dart';

Widget buildTextField({
  required TextEditingController controller,
  required String label,
  required String hint,
  required IconData icon,
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      prefixIcon: Icon(icon),
      labelText: label,
      hintText: hint,
      hintStyle: TextStyle(color: const Color(0xDD7B7A7A)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
