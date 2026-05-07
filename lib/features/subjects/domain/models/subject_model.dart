class SubjectModel {
  final String id;
  final String name;
  final String? icon;
  final DateTime? createdAt;

  SubjectModel({
    required this.id,
    required this.name,
    this.icon,
    this.createdAt,
  });
}
