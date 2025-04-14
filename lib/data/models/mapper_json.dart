class User {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  User({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory User.fromMap(map) {
    return User(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      completed: map['completed'],
    );
  }
}
