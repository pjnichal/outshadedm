import 'package:hive/hive.dart';
part 'userdetail.g.dart';

@HiveType(typeId: 0)
class UserDetail extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String age;
  @HiveField(2)
  final String gender;
  @HiveField(3)
  final String id;
  UserDetail(
      {required this.name,
      required this.age,
      required this.gender,
      required this.id});
}
