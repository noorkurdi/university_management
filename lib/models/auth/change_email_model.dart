import 'dart:convert';

class ChangeEmailModel {
  String email;
  ChangeEmailModel({
    required this.email,
  });

  ChangeEmailModel copyWith({
    String? email,
  }) {
    return ChangeEmailModel(
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
    };
  }

  factory ChangeEmailModel.fromMap(Map<String, dynamic> map) {
    return ChangeEmailModel(
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangeEmailModel.fromJson(String source) => ChangeEmailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChangeEmailModel(email: $email)';

  @override
  bool operator ==(covariant ChangeEmailModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}
