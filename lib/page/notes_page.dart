import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_phone_storage/model/notes.dart';
import 'package:hive_phone_storage/page/note_details_page.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final Box box = Hive.box('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:const Color(0xff5D1708),
        title: const Text('All Notes'),
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, box, _) {
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            //shrinkWrap: true,
            itemCount: box.keys.length,
            itemBuilder: (context, index) {
              Notes note = box.getAt(index);

              return Card(
                color: const Color(0xffD68573),
                child: ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Text(note.result, style: const TextStyle(fontWeight: FontWeight.bold),)
                  ),
                  title: Text(note.id, style: const TextStyle(color: Colors.white)),
                  subtitle: Text(note.text, style: const TextStyle(color: Colors.white)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, size: 30, color: Colors.white),
                    onPressed: () {
                      box.deleteAt(index);
                    }
                  ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NoteDetailsPage(note: note))),
                ),
              );
            }
          );
        }
      ),
    );
  }
}