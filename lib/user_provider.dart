import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = '';
  String _email = '';
  ImageProvider _avatar = AssetImage('images/default_avatar.jpeg');

  String get name => _name;
  String get email => _email;
  ImageProvider get avatar => _avatar;

  void setUserInfo(String name, String email) {
    _name = name;
    _email = email;
    notifyListeners();
  }

  void updateAvatar(ImageProvider newAvatar) {
    _avatar = newAvatar;
    notifyListeners();
  }
}
