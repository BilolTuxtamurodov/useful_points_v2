import 'package:hive_flutter/hive_flutter.dart';
import 'package:usefulpoints/data/storage/auth/holder.dart';

class ModePrefs extends Holder {
  late Box appBox;

  ModePrefs() {
    appBox = Hive.box(colorBox);
  }

  bool get appMode => appBox.get(colorBox, defaultValue: true);

  set appMode(bool color) => appBox.put(colorBox, color);

  @override
  Future<void> clearHolder() async => await appBox.clear();

  static const colorBox = 'app_mode';

}
