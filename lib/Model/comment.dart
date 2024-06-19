class Comment {
  String id;
  String userId;
  String userName;
  String userPhotoUrl;
  String text;

  Comment({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userPhotoUrl,
    required this.text,
  });

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      userPhotoUrl: map['userPhotoUrl'] ?? '',
      text: map['text'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userPhotoUrl': userPhotoUrl,
      'text': text,
    };
  }
}
