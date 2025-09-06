import 'package:hive/hive.dart';

class Localhelper {
  static late var userbox;
  static String KName = 'name';
  static String KImage = 'image';
  static String KIsuploaded = 'isuploaded';

  static init() async {
    userbox = await Hive.openBox('userbox');
  }

  static putdata(String key, dynamic value) {
    userbox.put(key, value);
  }

  static getdata(String key) {
    return userbox.get(key);
  }

  static putuserdate(String path, String name) {
    Localhelper.putdata(Localhelper.KImage, path);
    Localhelper.putdata(Localhelper.KName, name);
    Localhelper.putdata(Localhelper.KIsuploaded, true);
  }
}
