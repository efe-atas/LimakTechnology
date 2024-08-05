import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:flutter/material.dart';

class   LoginOrRegister extends StatefulWidget{
  const LoginOrRegister({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginOrRegisterState();
  }
}

class _LoginOrRegisterState extends State<LoginOrRegister>{

  bool showLoginPage = true;

void togglePages(){
  setState(() {
    showLoginPage = !showLoginPage;
  });
}

@override
  Widget build(BuildContext context) {
   if(showLoginPage){
    return LoginPage(onTap: togglePages,);
    }else{
      return RegisterPage(onTap: togglePages,);
   }
  }







}