class ApiConst {
  static const CONNECTION_TIME = 20000;
  static const SEND_TIME_OUT = 20000;
  // static const String Base_URl = "http://api.sap.mazgi.uz";
  static const String Base_URl = "https://nuqtalar.idrok.group";

  // Users
  static const String LOGIN = "/api/users/login/";
  static const String LOGIN_WITH_GOOGLE = "/api/users/google/";
  static const String ACTIVATE = "/api/users/activate/";
  static const String REGISTER = "/api/users/register/";
  static const String RESET_PASSWORD = "/api/users/reset-password/";
  static const String RESET_PASSWORD_CONFIRM = "/api/users/reset-password-confirm/";
  static const String GET_USER = "/api/users/user/";

  // Transaction
  static const String TRANSACTION = "/api/transactions/";

  // Information
  static const String INFO = "/api/infos/info/";
  static const String CARD_INFO = "/api/infos/card_info/";

  // BOOK
  static const String BOOK = "/api/book/";

}