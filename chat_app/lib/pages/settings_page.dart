import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/material.dart';
class SettingsPage extends StatelessWidget {      
  const SettingsPage({super.key});

  void logout() {
    // get auth service
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: logout,
          child: const Text('Logout'),
        ),
      ),
    );
  }
}