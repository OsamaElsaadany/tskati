import 'package:hive/hive.dart';
import 'package:tskaty/core/models/task_model.dart';

class Localhelper {
  static late Box userbox;
  static late Box<TaskModel> taskbox;
  static String KName = 'name';
  static String KImage = 'image';
  static String KIsuploaded = 'isuploaded';
  static String KIsdark = 'isdark';

  static init() async {
    Hive.registerAdapter<TaskModel>(TaskModelAdapter());
    userbox = await Hive.openBox('userbox');
    taskbox = await Hive.openBox<TaskModel>("taskbox");
  }

  static putdata(String key, dynamic value) {
    userbox.put(key, value);
  }

  static getdata(String key) {
    return userbox.get(key);
  }

  static puttask(String key, TaskModel value) {
    taskbox.put(key, value);
  }

  static TaskModel? gettask(String key) {
    return taskbox.get(key);
  }

  static changetheme() {
    bool cashedtheme = userbox.get(KIsdark) ?? false;
    userbox.put(KIsdark, !cashedtheme);
  }

  static putuserdate(String path, String name) {
    Localhelper.putdata(Localhelper.KImage, path);
    Localhelper.putdata(Localhelper.KName, name);
    Localhelper.putdata(Localhelper.KIsuploaded, true);
  }
}
