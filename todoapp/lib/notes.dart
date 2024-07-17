import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Notes();
  }
}

class _Notes extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: ListView.builder(
        itemCount: allNotes.length,
        itemBuilder: (context, index) {
          return allNotes[index];
        },
      ),
    );
  }
}
