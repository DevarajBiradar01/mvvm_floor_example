import 'package:flutter/material.dart';
import 'package:mvvm_floor_example/constants/string_constants.dart';
import 'package:mvvm_floor_example/model/note.dart';
import 'package:mvvm_floor_example/view_model/note_view_model.dart';
import 'package:mvvm_floor_example/widgets/text_form_field.dart';
import 'package:stacked/stacked.dart';

class AddNote extends StatelessWidget {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => NoteViewModel(),
      builder: (context, NoteViewModel viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Text(StringConstants.kAddNote),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextFormField(
                  titleController,
                  StringConstants.kEnterTitle,
                  key: Key('title'),
                  requiredFieldErrorMessage: StringConstants.kPleaseEnterTitle,
                  validationExpression: "",
                  validationErrorMessage: StringConstants.kPleaseEnterTitle,
                ),
                Expanded(
                  child: CustomTextFormField(
                    descriptionController,
                    StringConstants.kEnterDescription,
                    nMaxLines: 30,
                    key: Key('description'),
                    requiredFieldErrorMessage: StringConstants.kPleaseEnterDescription,
                    validationExpression: "",
                    validationErrorMessage: StringConstants.kPleaseEnterDescription,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    key: Key('addNoteToDB'),
                    onPressed: () => onAddNotePressed(viewModel),
                    child: Text(
                      'Add Note',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onAddNotePressed(NoteViewModel viewModel) {
    print("onAddNotePressed () - Form Validation : " +
        formKey.currentState!.validate().toString());
    if (formKey.currentState!.validate()) {
      String txtTitle = titleController.text;
      String txtDescription = descriptionController.text;
      Note note = new Note(
        new DateTime.now().millisecondsSinceEpoch,
        txtTitle,
        txtDescription,
      );
      viewModel.addNote(note);
    }
  }
}
