List<SubjectModel> subjectModelFromJson(List data) => List<SubjectModel>.from(
      data.map(
            (x) => SubjectModel.fromJson(x),
          ),
    );

List subjectModelToJson(List<SubjectModel> data) => List<dynamic>.from(
  data.map(
        (x) => x.toJson(),
  ),
);

class SubjectModel {
  SubjectModel({
    required this.credits,
    required this.id,
    required this.name,
    required this.teacher,
  });

  final int credits;
  final int id;
  final String name;
  final String teacher;

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        credits: json["credits"],
        id: json["id"],
        name: json["name"],
        teacher: json["teacher"],
      );

  Map<String, dynamic> toJson() => {
        "credits": credits,
        "id": id,
        "name": name,
        "teacher": teacher,
      };
}
