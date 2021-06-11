import 'package:flutter/cupertino.dart';
import 'package:mvvm_floor_example/dao/note_dao.dart';
import 'package:mvvm_floor_example/database/app_db.dart';
import 'package:mvvm_floor_example/model/note.dart';
import 'package:mvvm_floor_example/utils/navigation_manager.dart';
import 'package:mvvm_floor_example/utils/utility.dart';

class NoteViewModel extends ChangeNotifier {
  List<Note> _noteList = <Note>[];

  List<Note> get listNotes => _noteList;

  void getNoteList() async{
    print("getNoteList()");
    NoteDao noteDao = await getNoteInstance();
    noteDao.findAllNotes().then((value) {
      _noteList = value;
      notifyListeners();
    });
  }

  void addNote(Note note) async{
    print("addNote() - Title : " + note.txtTitle);
    print("addNote() - Description : " + note.txtDescription);
    NoteDao noteDao = await getNoteInstance();
    noteDao.insertNote(note).then((value) {
      _noteList.add(note);
      notifyListeners();
      NavigationManager.navigateToHome();
    });

  }

  void removeNote(Note note) async{
    print("addNote() - Id : " + note.nId.toString());
    NoteDao noteDao = await getNoteInstance();
    noteDao.deleteNote(note).then((value) {
      _noteList.remove(note);
      notifyListeners();
    });
  }
}
