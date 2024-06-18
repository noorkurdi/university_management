// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChangePasswordModel {
  //   "password" : "Gucrf1uf",
  // "new_password":"password",
  // "new_password_confirm": "password",
  String password;
  String newPassword;
  String newPasswordConfirm;
  ChangePasswordModel({
    required this.password,
    required this.newPassword,
    required this.newPasswordConfirm,
  });

  ChangePasswordModel copyWith({
    String? password,
    String? newPassword,
    String? newPasswordConfirm,
  }) {
    return ChangePasswordModel(
      password: password ?? this.password,
      newPassword: newPassword ?? this.newPassword,
      newPasswordConfirm: newPasswordConfirm ?? this.newPasswordConfirm,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
      'new_password': newPassword,
      'new_password_confirm': newPasswordConfirm,
    };
  }

  factory ChangePasswordModel.fromMap(Map<String, dynamic> map) {
    return ChangePasswordModel(
      password: map['password'] as String,
      newPassword: map['new_password'] as String,
      newPasswordConfirm: map['new_password_confirm'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangePasswordModel.fromJson(String source) => ChangePasswordModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChangePasswordModel(password: $password, new_password: $newPassword, new_password_confirm: $newPasswordConfirm)';

  @override
  bool operator ==(covariant ChangePasswordModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.password == password &&
      other.newPassword == newPassword &&
      other.newPasswordConfirm == newPasswordConfirm;
  }

  @override
  int get hashCode => password.hashCode ^ newPassword.hashCode ^ newPasswordConfirm.hashCode;
}
