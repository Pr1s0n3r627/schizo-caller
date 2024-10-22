import 'package:hive/hive.dart';

part 'caller_character.g.dart'; // Generate code for Hive adapter

@HiveType(typeId: 0)
class CallerCharacter {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String phoneNumber;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final String ringtone;

  CallerCharacter({
    required this.name,
    required this.phoneNumber,
    required this.image,
    required this.ringtone,
  });
}
