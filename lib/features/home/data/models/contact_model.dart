import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'contact_model.g.dart';

@HiveType(typeId: 0)
class ContactModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String firstName;
  @HiveField(3)
  final String? lastName;
  @HiveField(4)
  final String? avatar;

  const ContactModel(
      {required this.id,
      required this.email,
      required this.firstName,
      this.lastName,
      this.avatar});

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json['id'] as int,
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

  @override
  List<Object?> get props {
    return [
      id,
      email,
      firstName,
      lastName,
      avatar,
    ];
  }
}
