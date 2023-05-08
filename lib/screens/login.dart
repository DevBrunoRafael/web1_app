import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:web1_app/constants/colors.dart';
import 'package:web1_app/screens/home.dart';
import 'package:web1_app/screens/register.dart';
import 'package:web1_app/service/auth_service.dart';
import 'package:web1_app/widgets/custom_input.dart';
import 'package:web1_app/widgets/custom_input_password.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _authService = AuthService();

  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
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
                    "Login",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ), 

                  const SizedBox(height: 40),
                  CustomInput(
                    placeholder: "Email", 
                    controller: _emailControll, 
                    type: TextInputType.emailAddress, 
                    focus: _focusNodes[0], 
                    icon: Icons.email
                  ),

                  const SizedBox(height: 20),
                  CustomInputPassword(
                    controller: _passwordControll, 
                    focus: _focusNodes[1]
                  ),

                  const SizedBox(height: 0.03),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: const Text(
                        "Esqueceu a senha?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: titleText,
                        ),
                      ),
                      onPressed: () {

                      }, 
                    ),
                  ),

                  const SizedBox(height: 15),
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

                      FocusScopeNode currentFocusState = FocusScope.of(context);

                      if (_formKey.currentState!.validate()) {

                        bool response = await _authService.login(
                          email: _emailControll.text,
                          password: _passwordControll.text
                        );

                        if (!currentFocusState.hasPrimaryFocus) {
                          currentFocusState.unfocus();
                        }

                        if (response) {

                          Navigator.pushReplacement(context, 
                            MaterialPageRoute(
                              builder: (context) => Home()
                            )
                          );

                        } else {

                          _passwordControll.clear();
                          showSnackBar("message error");

                        }
                      }
                      
                    },
                    child: const Text(
                      'Sign In',
                      style:  TextStyle(
                        fontSize: 18,
                        color: textInput,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Ainda não tem uma conta? ', 
                          style: TextStyle(
                            fontSize: 14,
                            color: textInput,
                          ),
                        ),
                        TextSpan(
                          text: 'Crie agora.',
                          style: const TextStyle(
                            fontSize: 14,
                            color: titleText,
                            fontWeight: FontWeight.bold
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Register()),
                            );
                          }
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


  void showSnackBar(String message) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center),
        backgroundColor: Colors.redAccent,
      ),
    );
  }


}