abstract class Holder {
  late String email;
  late String accessToken;
  late String idToken;
  late bool logged;

  Future<void> clearHolder();
}
