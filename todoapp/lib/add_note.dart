import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/note.dart';
import 'package:todoapp/providers/note_provider.dart';

class AddNote extends StatefulWidget {
  const AddNote({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _AddNoteState();
  }
}

class _AddNoteState extends State<AddNote> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  //  final active = Provider((ref) => ref.watch(noteProvider));
    int counter = 0;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 23, 26),
      appBar: AppBar(
        title: const Text('Add Note'),
        backgroundColor: const Color.fromARGB(255, 101, 119, 134),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 48),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  textDirection: TextDirection.ltr,
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                    hintText: 'Enter your note here',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 138, 138, 138),
                      ),
                    ),
                  ),
                  maxLines:
                      null, // TextField'ın satır sayısının kullanıcı girişine bağlı olarak artmasını sağla
                ),
              ),
              const SizedBox(height: 200),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all<Size>(const Size(60, 60)),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.transparent),
                ),
                onPressed: () {
                  // TextField'dan metni al ve not listesine ekle
                  String noteText = _textController.text;
                  if (noteText.isNotEmpty) {
                    final Note newNote = Note(
                      note: noteText,
                      noteId: counter,
                    );
                    // context.read(noteProvider.notifier).addNote(newNote);
                    _textController.clear();
                    

                    counter++;
                    _textController.clear();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen(allNotes: allNotes)));
                  }
                },
                child: const Text(
                  'Save Note',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
