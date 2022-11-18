class Todo {
  String? id, title, description, due, userid;
  // bool? complete;

  Todo({
    this.id,
    // this.complete,
    this.description,
    this.due,
    this.title,
    this.userid,
  });

  factory Todo.fromJson(var json) {
    return Todo(
      userid: json['userid'],
      title: json['title'],
      // complete: json['complete'],
      description: json['description'],
      due: json['due'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['userid'] = userid ?? '';
    json['title'] = title ?? '';
    // json['complete'] = complete ?? false;
    json['description'] = description ?? '';
    json['due'] = due ?? '';
    return json;
  }
}
