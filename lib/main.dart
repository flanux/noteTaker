/*

                            NoteTaker

    Author: Abishkar subedi



*/


// TODO:  Understand context (exploits, usages)

import 'package:flutter/material.dart';
import 'note/makenotes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

// yo ma chai currently buffer ma bhako notes haru save hunxa
// Note: this is not permanent, app close bhaya ghayab hunxa
  final List<String> _notes = [];

// function that add then note entered by the user to _notes list
// setState() fn is imp cause this trigger the change of state to render again
  void _addNote(String noteContent) {
    setState(() {
      _notes.add(noteContent);
    });
  }

// yo fn harek note container ma embbed hunxa
// tyo index chai, user clicks and then automatically taken
// so the desired note can be delted
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
          child: _notes.isEmpty
              ? const Center(child: Text('Press the + button to add notes!'))
              : ListView.builder( // Note: Understand this, idk how this operates
                  itemCount: _notes.length,
                  itemBuilder: (context, index) { // Note: how many things get this context

                  // imp: yo MakeNotes doesn't carry any logics at all
                  // desgins change hanna paryo bhanea matra acess garne
                    return MakeNotes(
                      noteText: _notes[index],
                      onDelete: () => _deleteNote(index),
                    );
                  },
                ),
        ),
        floatingActionButton: FloatingActionButton(
          // Note: Understand where and when to embbed this anonymous
          onPressed: () {
            showDialog( // Note: are all the popup shits are showDialog ?
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
        },
          child: const Icon(Icons.add),
        ),
      );
  }
}

void main() {
  runApp(
    // imp: data yeta uti garna or ,
    // context lai proper use garna ,
    // whole app lai MaterialApp ma wrap hannu parxa !?
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}
