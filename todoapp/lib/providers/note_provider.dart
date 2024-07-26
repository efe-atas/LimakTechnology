import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/note.dart'; // Assuming your Note model is defined in note.dart

class NoteProvider extends StateNotifier<List<Note>> {
  NoteProvider() : super([]);

  void addNote(Note note) {
    state = [...state, note];
  }

  void removeNoteById(String id) {
    state = state.where((note) => note.noteId != id).toList();
  }

  void updateNote(String id, String newContent) {
    state = state
        .map((note) => note.noteId == id
            ? Note(noteId: note.noteId, note: newContent)
            : note)
        .toList();
  }
}

final noteProvider =
    StateNotifierProvider<NoteProvider, List<Note>>((ref) => NoteProvider());
