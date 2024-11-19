import 'package:categrised_search/screens/authentication/register.dart';
import 'package:categrised_search/screens/bottom_navbar.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: "Email"),
                  controller: _emailController,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Password"),
                  controller: _passwordController,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 50),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavbar(),));
                  },
                  child: Text("Sign In"),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text("Dont have an account"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register(),
                            ));
                      },
                      child: Text("Register"),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
