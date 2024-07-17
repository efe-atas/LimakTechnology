import 'package:flutter/material.dart';
import 'package:todoapp/add_note.dart';
import 'package:todoapp/notes.dart';
import 'package:todoapp/note.dart';

List<Note> allNotes = [];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(allNotes: allNotes),
      routes: {
        '/add_note': (context) => const AddNote(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Note> allNotes;

  const HomeScreen({super.key, required this.allNotes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 23, 26),
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const SizedBox(
          child: Text(
            'Notes',
            textAlign: TextAlign.left,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 101, 119, 134),
      ),
      body: const Notes(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_note');
              },
              icon: const Icon(
                Icons.add,
              ),
              iconSize: 40,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ],
        ),
      ),
    );
  }
}
