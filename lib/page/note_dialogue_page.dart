import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_phone_storage/model/notes.dart';

class NoteDialoguePage extends StatefulWidget {
  const NoteDialoguePage({super.key});

  @override
  State<NoteDialoguePage> createState() => _NoteDialoguePageState();
}

class _NoteDialoguePageState extends State<NoteDialoguePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController idController = TextEditingController();
  TextEditingController resultController = TextEditingController();
  TextEditingController textController = TextEditingController();

  final Box box = Hive.box('notes');
  final Box openBox = Hive.box('drafts');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Content'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: idController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ID'
                ),
                validator: (value) {
                  if(value!.isEmpty) {
                    return "The field can't be empty.";
                  }
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: resultController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Result'
                ),
                validator: (value) {
                  if(value!.isEmpty) {
                    return "The field can't be empty.";
                  }
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: textController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Comment'
                ),
              )
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            final form = _formKey.currentState!;

            if(form.validate()) {
              form.save();
              openBox.add(
                Notes(
                  id: idController.text,
                  result: resultController.text,
                  text: textController.text
                )
              );
            }
            Navigator.pop(context);
          }
        ),
        TextButton(
          child: const Text('Add'),
          onPressed: () {
            final form = _formKey.currentState!;

            if(form.validate()) {
              form.save();
              box.add(
                Notes(
                  id: idController.text,
                  result: resultController.text,
                  text: textController.text
                )
              );
              //print(box.getAt(0));
            }
            Navigator.pop(context);
          }
        )
      ],
    );
  }
}