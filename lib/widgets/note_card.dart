import 'package:flutter/material.dart';
import 'package:mvvm_floor_example/model/note.dart';
import 'package:mvvm_floor_example/view_model/note_view_model.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  NoteCard(this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.txtTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              note.txtDescription,
              style: TextStyle(letterSpacing: 1.5),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
        trailing: GestureDetector(
          child: Icon(
            Icons.remove_circle,
            color: Colors.redAccent,
          ),
          onTap: () => Provider.of<NoteViewModel>(context, listen: false)
              .removeNote(note),
        ),
      ),
    );
  }
}
