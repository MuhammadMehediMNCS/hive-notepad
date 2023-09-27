import 'package:hive/hive.dart';
part 'notes.g.dart';

@HiveType(typeId: 0)
class Notes {
  @HiveField(0)
  String id;

  @HiveField(1)
  String result;

  @HiveField(2)
  String text;

  Notes({
    required this.id,
    required this.result,
    required this.text
  });
}



@HiveType(typeId: 1)
class Drafts {
  @HiveField(0)
  String id;

  @HiveField(1)
  String result;

  @HiveField(2)
  String text;

  Drafts({
    required this.id,
    required this.result,
    required this.text
  });
}