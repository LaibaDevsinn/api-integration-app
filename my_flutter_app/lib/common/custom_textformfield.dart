import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  var text;
   CustomTextFormField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          hintText: text,
          hintStyle: const  TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 143, 136, 136),
              fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
  }
}
