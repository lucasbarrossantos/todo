import 'package:date_format/date_format.dart';

class Todo {
  String id;
  String createdAt;
  String description;
  String title;

  Todo({this.id, this.createdAt, this.description, this.title});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = formatDate(DateTime.parse(json['createdAt']),
        [dd, '/', mm, '/', yyyy, '  ', HH, ':', nn, ':', ss]) ?? '';
    description = json['description'] ?? '';
    title = json['title'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['description'] = this.description;
    data['title'] = this.title;
    return data;
  }

  @override
  String toString() {
    return 'Todo{id: $id, createdAt: $createdAt, description: $description, title: $title}';
  }
}
