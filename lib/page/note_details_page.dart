import 'package:flutter/material.dart';
import 'package:hive_phone_storage/model/notes.dart';

class NoteDetailsPage extends StatefulWidget {
  final Notes note;

  const NoteDetailsPage({super.key, required this.note});

  @override
  State<NoteDetailsPage> createState() => _NoteDetailsPageState();
}

class _NoteDetailsPageState extends State<NoteDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:const Color(0xff5D1708),
        centerTitle: true,
        title: const Text('Details of Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 2, color: const Color(0xffD68573))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: SizedBox(
                  width: 60,
                  child: Divider(thickness: 6, color: Color(0xff5D1708)),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'Student ID : ${widget.note.id}',
                style: const TextStyle(
                  fontFamily: 'Candara',
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'CGPA : ${widget.note.result}',
                style: const TextStyle(
                  fontFamily: 'Candara',
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Comment :',
                style: TextStyle(
                  fontFamily: 'Candara',
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  widget.note.text,
                  style: const TextStyle(
                    fontFamily: 'Candara',
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}