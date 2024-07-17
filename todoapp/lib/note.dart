import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';

class Note extends StatefulWidget {
  const Note({super.key, required this.note, required this.noteId});

  
  final String note;
  final int noteId;

  @override
  State<StatefulWidget> createState() {
    return _Note();
  }
}

class _Note extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 85, 85, 85),
      child: Padding(
        // Added padding to avoid elements touching the edges of the Card
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              // Allows the text to take available space
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.note,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Delete Note'),
                          content: const Text(
                              'Are you sure you want to delete this note?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  setState(() {
                                    allNotes = List.from(allNotes)
                                      ..removeWhere((element) =>
                                          element.noteId == widget.noteId);
                                  });
                                });
                                Navigator.of(context).pop();
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 28,
                    color: Color.fromARGB(217, 229, 228, 228),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
