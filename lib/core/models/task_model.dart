
import 'package:hive/hive.dart';

part 'task_model.g.dart';


@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? date;
  @HiveField(3)
  String? starttime;
  @HiveField(4)
  String? endtime;
  @HiveField(5)
  int? color;
  @HiveField(6)
  String? id;
  @HiveField(7)
  bool? iscompleted;
  TaskModel({
    this.title,
    this.description,
    this.date,
    this.starttime,
    this.endtime,
    this.color,
    this.id,
    this.iscompleted,
  });
}
