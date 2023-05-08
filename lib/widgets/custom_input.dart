import 'package:flutter/material.dart';
import 'package:web1_app/constants/colors.dart';

class CustomInput extends StatefulWidget {

  final TextEditingController controller;
  final String placeholder;
  final TextInputType type;
  final FocusNode focus;
  final IconData icon;

  CustomInput({ 
    Key? key,

    required this.placeholder,
    required this.controller,
    required this.type,
    required this.focus,
    required this.icon,

  }) : super(key: key);

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {

  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {

    return TextFormField(

      controller: widget.controller,
      focusNode: widget.focus,
      cursorColor: textInput,
      keyboardType: widget.type,
      obscuringCharacter: "*",

      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: textInput,
      ),
      
      decoration: InputDecoration(
        filled: true,
        fillColor: backInput,
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
        prefixIcon:  Align(
          widthFactor: 3,
          child: Icon(

            widget.icon,
            color: widget.focus.hasFocus 
              ? focusInput 
              : placeholderInput,

            size: 20,
          ),
        ),

      ),
    );
  }
}