
class Diary {
  String id = '' ;
  String title = '';
  String content = '';
  DateTime time = DateTime.now();
  DateTime createdTime = DateTime.now();
  DateTime updatedTime = DateTime.now();
  List<String> mediaUrl = [];

  Diary({
    required this.id,
    required this.title,
    required this.content,
    required this.time,
    required this.createdTime,
    required this.updatedTime,
    required this.mediaUrl
  });

  Diary.fromDatabase(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    time = json['time'];
    createdTime = json['createdTime'];
    updatedTime = json['updatedTime'];
    mediaUrl = json['mediaUrl'].split('--');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['time'] = time;
    data['createdTime'] = createdTime;
    data['updatedTime'] = updatedTime;
    data['mediaUrl'] = mediaUrl.join('--');
    return data;
  }
}