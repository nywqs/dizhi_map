import 'dart:ui';

import 'package:htwms/core/utils/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  SPUtils._internal();
  static final SPUtils _instance = SPUtils._internal();

  factory SPUtils() {
    return _instance;
  }

  static SharedPreferences? _spf;

  static Future<SharedPreferences> init() async {
    return _spf = await SharedPreferences.getInstance();
  }

  ///主题
  static Future<bool> saveThemeIndex(int value) {
    return _spf!.setInt('key_theme_color', value);
  }

  static int? getThemeIndex() {
    return _spf!.containsKey('key_theme_color')
        ? _spf!.getInt('key_theme_color')
        : 0;
  }

  ///深色模式
  static Future<bool> saveBrightness(bool isDark) {
    return _spf!.setBool('key_brightness', isDark);
  }

  static Brightness getBrightness() {
    bool? isDark = _spf!.containsKey('key_brightness')
        ? _spf!.getBool('key_brightness')
        : false;
    return isDark == true ? Brightness.dark : Brightness.light;
  }

  ///语言
  static Future<bool> saveLocale(String locale) {
    return _spf!.setString('key_locale', locale);
  }

  static String getLocale() {
    String? locale = _spf!.getString('key_locale');
    locale ??= LOCALE_FOLLOW_SYSTEM;
    return locale;
  }
  static Future<bool> saveHost(String host){
    return _spf!.setString('key_host', host);
  }

  static String? getHost() {
    return _spf?.getString('key_host');
  }
  ///昵称
  static Future<bool> saveNickName(String nickName) {
    return _spf!.setString('key_nickname', nickName);
  }

  static String? getNickName() {
    return _spf?.getString('key_nickname');
  }

  //token
  static Future<bool> saveToken(String token) {
    return _spf!.setString('key_token', token);
  }

  static String? getToken() {
    return _spf?.getString('key_token');
  }

  ///是否同意隐私协议
  static Future<bool> saveIsAgreePrivacy(bool isAgree) {
    return _spf!.setBool('key_agree_privacy', isAgree);
  }

  static bool? isAgreePrivacy() {
    if (!_spf!.containsKey('key_agree_privacy')) {
      return false;
    }
    return _spf!.getBool('key_agree_privacy');
  }

  ///是否已登陆
  static bool isLogined() {
    String? token = getToken();
    return token != null && token.isNotEmpty;
  }

  static logout() async {
    return _spf!.clear();
  }
}
