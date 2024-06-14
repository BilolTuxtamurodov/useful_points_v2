class CustomImages {
  // images
  static const String appLogo = 'assets/images/app_logo.svg';
  static const String appLogoDark = 'assets/images/app_logo_dark.svg';
  static const String backgroundCircles = 'assets/images/background_circles.svg';
  static const String videoImage = 'assets/images/video_image.png';
  static const String bookImage = 'assets/images/book_image.png';
  // icons
  static const String uzIcon = 'assets/icons/uz.svg';
  static const String ruIcon = 'assets/icons/ru.svg';
  static const String enIcon = 'assets/icons/en.svg';
  static const String frIcon = 'assets/icons/fr.svg';
  static const String checkIcon = 'assets/icons/check_icon.svg';
  static const String warningIcon = 'assets/icons/warning_icon.svg';
  static const String googleIcon = 'assets/icons/google.svg';
  static const String appleIcon = 'assets/icons/apple.svg';
  static const String modeIcon = 'assets/icons/mode_icon.svg';
  static const String playIcon = 'assets/icons/play_icon.svg';
  static const String infoIcon = 'assets/icons/info_icon.svg';
  static const String userCircleIcon = 'assets/icons/user-circle.svg';
  static const String phoneModeIcon = 'assets/icons/phone_mode.svg';
  static const String settingsIcon = 'assets/icons/settings_icon.svg';
  static const String alignLeftIcon = 'assets/icons/align-left.svg';
  static const String alignJustifyIcon = 'assets/icons/align-justify.svg';
  static const String copyIcon = 'assets/icons/copy_icon.svg';
  static const String cardsIcon = 'assets/icons/cards_icon.svg';
  static const String logOutIcon = 'assets/icons/logout_icon.svg';
  static const String noInternetIcon = 'assets/icons/no_internet.svg';


  static String getFlag(String lang) {
    switch (lang) {
      case 'en' : return enIcon;
      case 'fr' : return frIcon;
      case 'ru' : return ruIcon;
      default : return uzIcon;
    }
  }
}