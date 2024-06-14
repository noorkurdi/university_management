// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  String uniNumber;
  String password;
  LoginModel({
    required this.uniNumber,
    required this.password,
  });

  LoginModel copyWith({
    String? uniNumber,
    String? password,
  }) {
    return LoginModel(
      uniNumber: uniNumber ?? this.uniNumber,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uni_number': uniNumber,
      'password': password,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      uniNumber: map['uni_number'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginModel(uni_number: $uniNumber, password: $password)';

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uniNumber == uniNumber &&
      other.password == password;
  }

  @override
  int get hashCode => uniNumber.hashCode ^ password.hashCode;
}
