import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/providers/note_provider.dart'; 

class Notes extends ConsumerStatefulWidget{
  const Notes({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotesState();
}

class _NotesState extends ConsumerState<Notes> {
  @override
  Widget build(BuildContext context) {
    // Correctly access the state from the noteProvider
    final allNotes = ref.watch(noteProvider);
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: ListView.builder(
        itemCount: allNotes.length,
        itemBuilder: (context, index) {
          final note = allNotes[index];
          return ListTile(
            title: Text(note.note),
          );
        },
      ),
    );
  }
}
