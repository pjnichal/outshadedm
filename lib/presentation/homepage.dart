import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:outshadedm/models/userdetail.dart';
import 'package:outshadedm/presentation/userdetailscreen.dart';

import 'package:hive_flutter/hive_flutter.dart';
import '../buisness_logic/user/user_bloc.dart';
import '../models/boxes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("OutshaedDM")),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserFetchedSuccessful) {
              return ValueListenableBuilder(
                valueListenable: Boxes.getUserDetail().listenable(),
                builder: (context, value, child) {
                  return ListView(
                    children: [
                      ...state.users
                          .map((e) => Card(
                                child: ListTile(
                                  onTap: () {
                                    if (value.containsKey(e.id)) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => UserDetailScreen(
                                                    id: e.id,
                                                  )));
                                    } else {
                                      Flushbar(
                                              backgroundColor: Colors.black,
                                              message: "Please Sign in First !",
                                              duration:
                                                  const Duration(seconds: 1))
                                          .show(context);
                                    }
                                  },
                                  title: Text(e.name),
                                  subtitle:
                                      Text("Id : ${e.id} Type : ${e.atype}"),
                                  trailing: value.containsKey(e.id)
                                      ? TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        "Sure?, You want to sign out"),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              "Cancel")),
                                                      TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              value
                                                                  .delete(e.id);
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              "Confirm"))
                                                    ],
                                                  );
                                                });
                                          },
                                          child: const Text(
                                            "Sign Out",
                                            style: TextStyle(color: Colors.red),
                                          ))
                                      : TextButton(
                                          onPressed: () {
                                            TextEditingController age =
                                                TextEditingController();
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                String? gender;
                                                return AlertDialog(
                                                  title: const Text(
                                                      "Enter name, gender and age."),
                                                  content: StatefulBuilder(
                                                    builder:
                                                        (context, setState) {
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            const Text(
                                                              "Select Gender",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            RadioListTile(
                                                              title: const Text(
                                                                  "Male"),
                                                              value: "Male",
                                                              groupValue:
                                                                  gender,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  gender = value
                                                                      .toString();
                                                                });
                                                              },
                                                            ),
                                                            RadioListTile(
                                                              title: const Text(
                                                                  "Female"),
                                                              value: "Female",
                                                              groupValue:
                                                                  gender,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  gender = value
                                                                      .toString();
                                                                });
                                                              },
                                                            ),
                                                            RadioListTile(
                                                              title: const Text(
                                                                  "Other"),
                                                              value: "Other",
                                                              groupValue:
                                                                  gender,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  gender = value
                                                                      .toString();
                                                                });
                                                              },
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            const Text(
                                                              "Enter Age",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            TextField(
                                                                controller: age,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    const InputDecoration(
                                                                        hintText:
                                                                            "Age")),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                            "Cancel")),
                                                    TextButton(
                                                        onPressed: () {
                                                          if (gender == null ||
                                                              age.text == "" ||
                                                              age.text
                                                                  .isEmpty) {
                                                            Flushbar(
                                                              backgroundColor:
                                                                  Colors.red,
                                                              message:
                                                                  "Please Fill Details",
                                                              duration:
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                            ).show(context);
                                                          }
                                                          final userDetail =
                                                              UserDetail(
                                                                  name: e.name,
                                                                  age: age.text,
                                                                  gender:
                                                                      gender!,
                                                                  id: e.id);
                                                          final box = Boxes
                                                              .getUserDetail();
                                                          box.put(userDetail.id,
                                                              userDetail);
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (_) =>
                                                                      UserDetailScreen(
                                                                        id: e
                                                                            .id,
                                                                      )));
                                                        },
                                                        child: const Text(
                                                            "Submit"))
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: const Text("Sign In")),
                                ),
                              ))
                          .toList()
                    ],
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
