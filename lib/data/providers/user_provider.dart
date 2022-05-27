import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  String? _email = "";
  String? _username = "";
  String? _imgUrl = "";

  String get email => _email!;
  String get username => _username!;
  String get imgUrl => _imgUrl!;

  void setEmail(String email) {
    _email = email;
  }

  void setUsername(String username) {
    _username = username;
  }

  void setImgUrl(String imgUrl) {
    _imgUrl = imgUrl;
  }

}