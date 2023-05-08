import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:web1_app/screens/login.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_input_password.dart';
import '../constants/colors.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_input_password.dart';


class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];

  @override
  void initState() {
    super.initState();

    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  final _nameControll = TextEditingController();
  final _emailControll = TextEditingController();
  final _passwordControll = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);

    final width = mediaQuery.size.height;
    final height = mediaQuery.size.width;

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: cardLogin,
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 20, 
              vertical: 60
            ),
            width: width,
            color: cardLogin,
            child: Form(
              key: _formKey,
              child: Column(
                children: [

                  const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ), 

                  const SizedBox(height: 40),
                  CustomInput(
                    placeholder: "Nome", 
                    controller: _nameControll, 
                    type: TextInputType.emailAddress, 
                    focus: _focusNodes[0], 
                    icon: Icons.email
                  ),

                  const SizedBox(height: 20),
                  CustomInput(
                    placeholder: "Email", 
                    controller: _emailControll, 
                    type: TextInputType.emailAddress, 
                    focus: _focusNodes[1], 
                    icon: Icons.email
                  ),

                  const SizedBox(height: 20),
                  CustomInputPassword(
                    controller: _passwordControll, 
                    focus: _focusNodes[2]
                  ),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: titleText,
                      shadowColor: const Color(0xFF963AFF),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      minimumSize: const Size(500, 60), 
                    ),
                    onPressed: () async {
                        
                      // imnplements logic

                    },
                    child: const Text(
                      'Sign Up',
                      style:  TextStyle(
                        fontSize: 18,
                        color: textInput,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      // ação ao pressionar o botão "Voltar ao login"
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back_ios,
                          color: titleText,
                          size: 14,
                        ),

                        SizedBox(width: 5),

                        Text(
                          'Voltar ao login',
                          style: TextStyle(
                            color: titleText,
                            fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}