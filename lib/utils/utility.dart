import 'package:mvvm_floor_example/dao/note_dao.dart';
import 'package:mvvm_floor_example/database/app_db.dart';

Future<NoteDao> getNoteInstance() async{
  final database = await $FloorAppDatabase.databaseBuilder('app_db.db').build();
  return  database.noteDao;
}