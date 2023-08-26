class ContactModel {
  final int id;
  final String email;
  final String firstName;
  final String? lastName;
  final String? avatar;

  ContactModel(
      {required this.id,
      required this.email,
      required this.firstName,
      this.lastName,
      this.avatar});

  ContactModel.fromJson(Map<String, dynamic> json, this.id, this.email,
      this.firstName, this.lastName, this.avatar) {
    ContactModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'] as String?,
      avatar: json['avatar'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}
