import 'package:flutter/material.dart';
OutlineInputBorder commonBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0), // Rounded corners
    borderSide: BorderSide(
      color: Colors.yellow,
    ),
  );
}