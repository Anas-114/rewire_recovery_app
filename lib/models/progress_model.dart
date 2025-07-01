
// models/progress_model.dart
import 'package:hive/hive.dart';
part 'progress_model.g.dart';

@HiveType(typeId: 0)
class ProgressModel extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  int progress;

  ProgressModel({required this.date, required this.progress});
}
