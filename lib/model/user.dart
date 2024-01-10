import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String name;
  @HiveField(1)
  String nation;
  @HiveField(2)
  int age;

  User({
    required this.name,
    required this.nation,
    required this.age,
  });
}
