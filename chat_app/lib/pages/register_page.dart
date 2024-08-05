import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

    final void Function()? onTap;
  void register(BuildContext context) {
    // 
    final _auth = AuthService();


    // passwords match => register
    if(passwordController.text == confirmPasswordController.text){

      try{
        _auth.signUpWithEmailAndPassowrd(emailController.text , passwordController.text);
      }
      catch(e){
       showDialog(context: context, builder: (context)=> AlertDialog(
         title: const Text('Error'),
         content: Text(e.toString()),
         actions: [
           TextButton(onPressed: ()=> Navigator.pop(context), child: const Text('OK'))
         ],
       ));
      }
     
    }
    else{
      showDialog(context: context, builder: (context)=> AlertDialog(
        title: const Text('Error'),
        content: const Text('Passwords do not match'),
        actions: [
          TextButton(onPressed: ()=> Navigator.pop(context), child: const  Text('OK'))
        ],
      ));
    }



    
  }

  RegisterPage({super.key, this.onTap});

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
            Text('Lets get started',
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
            MyTextfield(
              hintText: 'Password Again',
              obscureText: true,
              controller: confirmPasswordController,
            ),

            const SizedBox(height: 10),
            // login button

            MyButton(
              text: 'Register',
              onTap: () => register(context),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? ',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16)),
                GestureDetector(
                  onTap: onTap,
                  child: Text('Login now',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
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
