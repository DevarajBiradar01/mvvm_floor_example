import 'package:floor/floor.dart';

@Entity()
class Note {
  @PrimaryKey(autoGenerate: true)
  int nId;

  String txtTitle;
  String txtDescription;

  Note(this.nId, this.txtTitle, this.txtDescription);
}
