
// models/type_model.dart
import 'package:hive/hive.dart';
import 'package:recoverly/models/progress_model.dart';
part 'type_model.g.dart';

@HiveType(typeId: 1)
class TypeModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String type;

  @HiveField(2)
  List<ProgressModel> progress;

  @HiveField(3)
  DateTime taskDate;

  @HiveField(4)
  bool isDone;

  @HiveField(5)
  String? description;

  TypeModel({
    required this.title,
    required this.type,
    required this.progress,
    required this.taskDate,
    this.isDone = false,
    this.description,
  });
}

