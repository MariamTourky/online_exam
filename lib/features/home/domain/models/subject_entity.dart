class SubjectEntity {
  String? id;
  String? name;
  String? icon;
  DateTime? createdAt;

  SubjectEntity({this.id, this.name, this.icon, this.createdAt});
  @override
  String toString() {
    // TODO: implement toString
    return 'SubjectEntity(id: $id, name: $name, icon: $icon, createdAt: $createdAt)';
  }
  }

