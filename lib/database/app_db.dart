import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

import 'package:mvvm_floor_example/dao/note_dao.dart';
import 'package:mvvm_floor_example/model/note.dart';

part 'app_db.g.dart';

@Database(version: 1, entities: [Note])
abstract class AppDatabase extends FloorDatabase {
  NoteDao get noteDao;
}
