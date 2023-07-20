class User {
  const User({
    required this.id,
    required this.name,
    required this.phone,
    required this.classes,
  });

  final String name;
  final String id;
  final String phone;
  final List<String> classes;

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'phone': phone,
        'classes': classes,
      };
}
