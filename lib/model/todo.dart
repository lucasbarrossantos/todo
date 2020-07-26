class Todo {
  String id;
  String createdAt;
  String description;
  String title;

  Todo({this.id, this.createdAt, this.description, this.title});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'] ?? '';
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

  @override
  bool operator ==(other) {
    return (other is Todo) && hashCode == other.hashCode;
  }

  @override
  int get hashCode =>
      id.hashCode ^ createdAt.hashCode ^ description.hashCode ^ title.hashCode;
}
