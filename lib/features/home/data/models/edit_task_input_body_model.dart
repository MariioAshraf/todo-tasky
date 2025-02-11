class EditTaskInputBodyModel {
  final String image;
  final String title;
  final String desc;
  final String priority;
  final String status;
  final String userId;

  EditTaskInputBodyModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.status,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    map['title'] = title;
    map['desc'] = desc;
    map['priority'] = priority;
    map['status'] = status;
    map['user'] = userId;
    return map;
  }
}
