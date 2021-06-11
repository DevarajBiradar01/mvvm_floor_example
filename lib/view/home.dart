import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_floor_example/constants/string_constants.dart';
import 'package:mvvm_floor_example/view_model/note_view_model.dart';
import 'package:mvvm_floor_example/widgets/floating_button.dart';
import 'package:mvvm_floor_example/widgets/note_card.dart';
import 'package:stacked/stacked.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => NoteViewModel(),
      onModelReady: (NoteViewModel viewModel) => viewModel.getNoteList(),
      builder: (context, NoteViewModel viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Text(StringConstants.kAppName),
          centerTitle: true,
        ),
        floatingActionButton: FloatingButton(),
        body: ListView.builder(
          key: Key('noteList'),
          itemCount: viewModel.listNotes.length,
          itemBuilder: (context, index) {
            return NoteCard(viewModel.listNotes[index]);
          },
        ),
      ),
    );
  }
}
