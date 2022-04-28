List<ClassListModel> classListModelFromJson(List data) =>
    List<ClassListModel>.from(
      data.map(
            (x) => ClassListModel.fromJson(x),
          ),
    );

List classListModelToJson(List<ClassListModel> data) => List<dynamic>.from(
  data.map(
        (x) => x.toJson(),
  ),
);

class ClassListModel {
  ClassListModel({
    required this.id,
    required this.layout,
    required this.name,
    required this.size,
  });

  final int id;
  final String layout;
  final String name;
  final int size;

  factory ClassListModel.fromJson(Map<String, dynamic> json) => ClassListModel(
        id: json["id"],
        layout: json["layout"],
        name: json["name"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "layout": layout,
        "name": name,
        "size": size,
      };
}
