import 'package:floor/floor.dart';
import 'package:mvvm_floor_example/model/note.dart';

@dao
abstract class NoteDao {
  @Query('SELECT * FROM Note')
  Future<List<Note>> findAllNotes();

  @Query('SELECT * FROM Note WHERE nId = :nId')
  Stream<Note?> findNoteById(int nId);

  @insert
  Future<void> insertNote(Note note);

  @delete
  Future<void> deleteNote(Note note);

  @update
  Future<void> updateNote(Note note);
}