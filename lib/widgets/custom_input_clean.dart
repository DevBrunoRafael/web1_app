import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomInputClean extends StatefulWidget {

  final String placeholder;
  final TextEditingController controller;

  const CustomInputClean({

    Key? key, 
    required this.placeholder,  
    required this.controller 

  }) : super(key: key);

  @override
  _CustomInputCleanState createState() => _CustomInputCleanState();
}

class _CustomInputCleanState extends State<CustomInputClean> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      controller: widget.controller,
      cursorColor: placeholderInput,
      keyboardType: TextInputType.text,

      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: textInput,
      ),
      
      decoration: InputDecoration(
        filled: true,
        fillColor: cardLogin,
        hintText: widget.placeholder,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: focusInput, 
            width: 2
          ),
          borderRadius: BorderRadius.circular(5),
        ),

        hintStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: placeholderInput,
        ),
      ),
    );
  }
}