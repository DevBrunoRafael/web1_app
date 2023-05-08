import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomInputPassword extends StatefulWidget {

  final TextEditingController controller;
  final FocusNode focus;

  CustomInputPassword({ 
    Key? key,

    required this.controller,
    required this.focus,

  }) : super(key: key);

  @override
  _CustomInputPasswordState createState() => _CustomInputPasswordState();
}

class _CustomInputPasswordState extends State<CustomInputPassword> {

  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {

    return TextFormField(

      controller: widget.controller,
      focusNode: widget.focus,
      cursorColor: textInput,
      keyboardType: TextInputType.text,
      obscureText: _showPassword,
      obscuringCharacter: "*",

      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: textInput,
      ),
      
      decoration: InputDecoration(
        filled: true,
        fillColor: backInput,
        hintText: "Senha",
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

            Icons.lock,
            color: widget.focus.hasFocus 
              ? focusInput 
              : placeholderInput,

            size: 20,
          ),
        ),

        suffixIcon: Align(
          widthFactor: 1.5,
          child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(

              _showPassword ? Icons.visibility_off : Icons.visibility,
              color: widget.focus.hasFocus 
                ? focusInput 
                : placeholderInput,

              size: 20,
            ),
            onPressed: () {
              setState(() {

                _showPassword = !_showPassword;

              });
            },
          ),
        ),

      ),
    );
  }
}