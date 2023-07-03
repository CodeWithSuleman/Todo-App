class User {
  final String id;
  final String name;
  final int age;

  User({
    required this.id,
    required this.name,
    required this.age,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      age: json["age"],
    );
  }
}

///{
///   "id": "1"
///   "name": "Abdullah"
///   "age": "22"
///}
