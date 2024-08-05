import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final void Function()? onTap;
   
  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    final authService = AuthService();

    try{
      await authService.signinWithEmailAndPassowrd(emailController.text, passwordController.text);
    }

    catch(e){
      showDialog(context: context, builder: (context)=> AlertDialog(
        title: Text('Error'),
        content: Text(e.toString()),
        actions: [
          TextButton(onPressed: ()=> Navigator.pop(context), child: Text('OK'))
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(Icons.message_sharp,
                size: 60, color: Theme.of(context).colorScheme.primary),

            const SizedBox(height: 16),
            // welcome text
            Text('Welcome to Chat App',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16)),

            const SizedBox(height: 16),

            // email input

            MyTextfield(
              hintText: 'Email',
              obscureText: false,
              controller: emailController,
            ),
            const SizedBox(height: 10),
            // password input
            MyTextfield(
              hintText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),

            const SizedBox(height: 10),
            // login button

            MyButton(
              text: 'Login',
              onTap: ()=> login(context),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member? ',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16)),
                GestureDetector(
                  onTap: onTap,
                  child: Text('Sign up',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w800)),
                ),
              ],
            ),

            // register button
          ],
        ),
      ),
    );
  }
}
