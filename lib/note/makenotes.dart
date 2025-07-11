import 'package:flutter/material.dart';

class MakeNotes extends StatelessWidget {
  final String noteText;
  final VoidCallback onDelete;

  const MakeNotes({super.key, required this.noteText, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            noteText,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
            ),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete, color: Colors.red,),
          )
        ],
      ),
    );
  }
}
