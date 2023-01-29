import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static User myUser = User(
    name: 'CIMS MOYO',
    email: 'cims@gmail.com',
    phone: '(071) 648-5040',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}

class User {
  String name;
  String email;
  String phone;

  // Constructor
  User({
    required this.name,
    required this.email,
    required this.phone,
  });

  User copy({
    String? name,
    String? phone,
    String? email,
  }) =>
      User(
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
      };
}
