List<StudentModel> studentModelFromJson(List data) => List<StudentModel>.from(
      data.map(
            (x) => StudentModel.fromJson(x),
          ),
    );

List studentModelToJson(List<StudentModel> data) => List<dynamic>.from(
  data.map(
        (x) => x.toJson(),
  ),
);

class StudentModel {
  StudentModel({
    required this.age,
    required this.email,
    required this.id,
    required this.name,
  });

  final int age;
  final String email;
  final int id;
  final String name;

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        age: json["age"],
        email: json["email"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "email": email,
        "id": id,
        "name": name,
      };
}
