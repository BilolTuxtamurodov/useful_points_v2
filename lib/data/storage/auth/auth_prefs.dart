import 'package:hive_flutter/hive_flutter.dart';
import 'package:usefulpoints/data/storage/auth/holder.dart';

class AuthPrefs extends Holder {
  late Box authBox;

  AuthPrefs() {
    authBox = Hive.box(authBoxID);
  }

  @override
  String get email => authBox.get(emailId, defaultValue: '');

  @override
  set email(String token) => authBox.put(emailId, token);

  @override
  bool get logged => authBox.get(loggedId, defaultValue: false);

  @override
  set logged(bool token) => authBox.put(loggedId, token);

  @override
  String get accessToken => authBox.get(accessTokenId, defaultValue: '');

  @override
  set accessToken(String token) => authBox.put(accessTokenId, token);

  @override
  String get idToken => authBox.get(idTokenId, defaultValue: '');

  @override
  set idToken(String token) => authBox.put(idTokenId, token);

  @override
  Future<void> clearHolder() async => await authBox.clear();

  static const authBoxID = 'auth_hive_box';
  static const emailId = 'email';
  static const accessTokenId = 'access_token';
  static const idTokenId = 'id_token';
  static const loggedId = 'logged';

}
