import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/user.dart';
import 'package:flutter_application_2/screen/read_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('userBox');
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Box<User> box;
  @override
  void initState() {
    super.initState();
    box = Hive.box('userBox');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReadPage(box: box),
    );
  }
}
