import 'package:chat_app/pages/auth/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FormKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: FormKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Comminiti",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Login now to see what they are talking about!",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Image.asset("assets/login.png"),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                      labelText: "Email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },

                    //check validation

                    validator: (val) {
                      return RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val!)
                          ? null
                          : "Please enter a valid email";
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: textInputDecoration.copyWith(
                      labelText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    validator: (val) {
                      if (val!.length < 6) {
                        return "Password must be atleast 6 characters";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        login();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text.rich(TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Register Here",
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            nextScreen(context, RegisterPage());
                          },
                      )
                    ],
                  ))
                ]),
          ),
        ),
      ),
    );
  }

  login() {
    if (FormKey.currentState!.validate()) {}
  }
}
