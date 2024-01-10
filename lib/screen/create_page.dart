import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CreatePage extends StatefulWidget {
  CreatePage({super.key, required this.box});

  Box<User> box;

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nationController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
                label: Text("Name"), hintText: "Enter Name"),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: nationController,
            decoration: const InputDecoration(
                label: Text("Nation"), hintText: "Enter Nation"),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: ageController,
            decoration: const InputDecoration(
                label: Text("Age"), hintText: "Enter Age"),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    nationController.text.isNotEmpty &&
                    ageController.text.isNotEmpty) {
                  setState(() {
                    widget.box.put(
                        nameController.text,
                        User(
                            name: nameController.text,
                            nation: nationController.text,
                            age: int.parse(ageController.text)));
                  });
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please Input All")));
                }
              },
              child: const Text("SUBMIT")),
        ],
      ),
    );
  }
}
