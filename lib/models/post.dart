
class Post {
  int? id;
  String? title;
  String? author;
  String? text;
  String? createdAt;

  Post({ this.id, this.title, this.author, this.text, this.createdAt });

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    text = json['text'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['author'] = author;
    data['text'] = text;
    data['createdAt'] = createdAt;
    return data;
  }
}