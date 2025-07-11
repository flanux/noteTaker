import 'package:flutter/material.dart';
import 'note/makenotes.dart';

// 1. Change MyApp to a StatefulWidget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState(); // 2. Create the State class
}

// 2. Define the State class for MyApp
class _MyAppState extends State<MyApp> {
  // 3. Declare a mutable list to hold your notes (this is your 'state')
  //    Initialize it with some dummy notes for a start
  final List<String> _notes = [];

  // 4. Function to add a new note
  void _addNote(String noteContent) {
    setState(() {
      _notes.add(noteContent); // Add the new note to the list });
    });
  }

  void _deleteNote(index) {
    setState(() {
          _notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Notes App'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          // 6. Use ListView.builder for potentially long lists
          //    This is more efficient than Column for many items.
          //    If you prefer Column for now, you can keep it, but ListView.builder
          //    is a better practice for dynamic lists.
          child: _notes.isEmpty
              ? const Center(child: Text('Press the + button to add notes!'))
              : ListView.builder(
                  itemCount: _notes.length,
                  itemBuilder: (context, index) {
                    // 7. Pass each note from the _notes list to MakeNotes
                    return MakeNotes(
                      noteText: _notes[index],
                      onDelete: () => _deleteNote(index),
                    );
                  },
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
            context: context,
            builder: (context) {
              String newNote = '';
              return AlertDialog(
                title: Text('Add note'),
                content: TextField(
                  onChanged: (value) => newNote = value,
                  decoration: InputDecoration(
                    hintText: "enter your note"
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('cancel'),
                  ),

                  TextButton(
                    onPressed: () {
                      if(newNote.isNotEmpty){
                        _addNote(newNote);
                      }
                      Navigator.pop(context);
                    },
                    child: Text('ok'),
                  ),
                ],
              );
            }
          );
        },// 8. Call your _addNote function here
          child: const Icon(Icons.add),
        ),
      );
  }
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}
