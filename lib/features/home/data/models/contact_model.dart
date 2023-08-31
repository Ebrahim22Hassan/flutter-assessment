import '../../domain/entities/contact_entity.dart';

class ContactModel extends ContactEntity {
  final int? id;
  final String email;
  final String firstName;
  final String? lastName;
  final String? avatar;

  ContactModel(
      {this.id,
      required this.email,
      required this.firstName,
      this.lastName,
      this.avatar})
      : super(
          id: id!,
          email: email,
          firstName: firstName,
          lastName: lastName!,
          avatar: avatar ?? '',
        );

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json['id'] as int?,
        email: json['email'] as String,
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String?,
        avatar: json['avatar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'avatar': avatar,
      };
}
