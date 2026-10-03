class Chore {
  final String id;
  final String name;
  final String? description;
  bool isCompleted;

  Chore({
    required this.id,
    required this.name,
    this.description,
    this.isCompleted = false,
  });
}
