import 'package:hive/hive.dart';
import 'package:outshadedm/models/userdetail.dart';

class Boxes {
  static Box<UserDetail> getUserDetail() => Hive.box<UserDetail>('userdetails');
}
