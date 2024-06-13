import 'package:hive_flutter/hive_flutter.dart';
import 'package:usefulpoints/data/storage/auth/holder.dart';

class LangPrefs extends Holder {
  late Box appBox;

  LangPrefs() {
    appBox = Hive.box(langBox);
  }

  String get lang => appBox.get(langBox, defaultValue: 'ru');

  set lang(String lang) => appBox.put(langBox, lang);

  @override
  Future<void> clearHolder() async => await appBox.clear();

  static const langBox = 'lang';

}
