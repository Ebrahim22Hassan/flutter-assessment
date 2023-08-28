import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/constants.dart';
import '../../../../../core/utils/assets.dart';

class AppFAB extends StatelessWidget {
  const AppFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, bottom: 18),
      child: FloatingActionButton(
        elevation: 30,
        onPressed: () {
          addContactWidget(context);
        },
        backgroundColor: kPrimaryColor,
        child: SizedBox(
          height: 20,
          child: Image.asset(AssetsData.addIcon),
        ),
      ),
    );
  }

  Future<dynamic> addContactWidget(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailNameController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 150,
            child: Column(
              children: [
                TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                ),
                TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  ),
                ),
                TextField(
                  controller: emailNameController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (firstNameController.text.isNotEmpty &&
                    lastNameController.text.isNotEmpty &&
                    emailNameController.text.isNotEmpty) {
                  addData(
                    firstNameController.text,
                    lastNameController.text,
                    emailNameController.text,
                  );
                  //Navigator.of(context).pop();
                }
              },
              child: const Text("Add"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            )
          ],
        );
      },
    );
  }

  void addData(String firstName, String lastName, String email) async {
    var dio = Dio();
    var response = await dio.post(
      'https://reqres.in/api/users',
      data: {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
      },
    );
    print(response.statusCode);
    print(response.data.toString());
  }
}
