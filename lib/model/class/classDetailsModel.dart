
class ClassDetailsModel {
  ClassDetailsModel({
    required this.id,
    required this.layout,
    required this.name,
    required this.size,
    required this.subject,
  });

  final int id;
  final String layout;
  final String name;
  final int size;
  final String subject;

  factory ClassDetailsModel.fromJson(Map<String, dynamic> json) => ClassDetailsModel(
    id: json["id"],
    layout: json["layout"],
    name: json["name"],
    size: json["size"],
    subject: json["subject"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "layout": layout,
    "name": name,
    "size": size,
    "subject": subject,
  };
}
