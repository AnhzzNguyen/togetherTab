class HouseholdMember {
  final String id;
  final String name;
  final String? email;

  HouseholdMember({
    required this.id,
    required this.name,
    this.email,
  });
}
