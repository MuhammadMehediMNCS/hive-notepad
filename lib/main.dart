import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_phone_storage/model/notes.dart';
import 'package:hive_phone_storage/page/draft_page.dart';
import 'package:hive_phone_storage/page/note_dialogue_page.dart';
import 'package:hive_phone_storage/page/notes_page.dart';
import 'package:hive_phone_storage/widget/tab_bar_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(NotesAdapter());
  await Hive.openBox('notes');
  await Hive.openBox('drafts');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final pages = [
    const NotesPage(),
    const DraftPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[index],
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff5D1708),
        child: const Icon(Icons.create, color: Colors.white,),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const NoteDialoguePage()
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: TabBarWidget(
        index: index,
        onChangedTab: onChangedTab
      )
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}