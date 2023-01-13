import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:outshadedm/models/userdetail.dart';
import 'package:outshadedm/presentation/homepage.dart';
import 'package:outshadedm/provider/userprovider.dart';
import 'package:outshadedm/repository/userrepository.dart';

import 'buisness_logic/user/user_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDetailAdapter());
  await Hive.openBox<UserDetail>('userdetails');
  runApp(const OutshadeDM());
}

class OutshadeDM extends StatelessWidget {
  const OutshadeDM({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) =>
            UserBloc(UserRepository(userProvider: UserProvider()))
              ..add(FetchUser()),
        child: const HomePage(),
      ),
    );
  }
}
