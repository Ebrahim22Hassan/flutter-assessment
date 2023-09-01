import 'package:hive/hive.dart';

part 'contact_entity.g.dart';

@HiveType(typeId: 0)
class ContactEntity {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  String email;
  @HiveField(2)
  String firstName;
  @HiveField(3)
  String? lastName;
  @HiveField(4)
  final String? avatar;
  @HiveField(5)
  bool? isFavorite;

  ContactEntity(
      {this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      this.avatar,
      this.isFavorite = false});
}
