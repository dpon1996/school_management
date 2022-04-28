List<RegistrationModel> registrationModelFromJson(List data) =>
    List<RegistrationModel>.from(
      data.map(
            (x) => RegistrationModel.fromJson(x),
          ),
    );

List registrationModelToJson(List<RegistrationModel> data) => List<dynamic>.from(
  data.map(
        (x) => x.toJson(),
  ),
);

class RegistrationModel {
  RegistrationModel({
    required this.id,
    required this.student,
    required this.subject,
  });

  final int id;
  final int student;
  final int subject;

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        id: json["id"],
        student: json["student"],
        subject: json["subject"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student": student,
        "subject": subject,
      };
}
