import 'dart:convert';

class CollageModel {
  int id;
  String name;
  CollageModel({
    required this.id,
    required this.name,
  });

  CollageModel copyWith({
    int? id,
    String? name,
  }) {
    return CollageModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory CollageModel.fromMap(Map<String, dynamic> map) {
    return CollageModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CollageModel.fromJson(String source) =>
      CollageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CollageModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant CollageModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
