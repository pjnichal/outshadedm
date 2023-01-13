import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import '../models/boxes.dart';
import '../models/userdetail.dart';

class UserDetailScreen extends StatelessWidget {
  final String id;
  const UserDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OutshadeDm"),
      ),
      body: ValueListenableBuilder<Box<UserDetail>>(
        valueListenable: Boxes.getUserDetail().listenable(),
        builder: (context, value, child) {
          final user = value.get(id);
          return Center(
              child: Text(
            '${user!.name}\n${user.age}\n${user.gender}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ));
        },
      ),
    );
  }
}
