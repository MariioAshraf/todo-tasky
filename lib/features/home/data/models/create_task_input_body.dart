class CreateTaskInputBodyModel {
  final String image;
  final String title;
  final String desc;
  final String priority;
  final String dueDate;

  CreateTaskInputBodyModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.dueDate,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    map['title'] = title;
    map['desc'] = desc;
    map['priority'] = priority;
    map['dueDate'] = dueDate;
    return map;
  }


}
