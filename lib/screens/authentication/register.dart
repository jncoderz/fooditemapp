import 'package:categrised_search/screens/authentication/sign_in.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: "Username"),
                  controller: _usernameController,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Email"),
                  controller: _emailController,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Password"),
                  controller: _passwordController,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "ConfirmPassword"),
                  controller: _confirmPasswordController,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(350, 50)),
                  onPressed: () {},
                  child: Text("Sign Up"),
                ),
            SizedBox(height: 30,),
            Row(children: [Text("If you have an account ?"),
            TextButton(onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
            }, child: Text("Login"),),
            ],)
              ],
            ),
          )),
    );
  }
}
