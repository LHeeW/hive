import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/user.dart';
import 'package:flutter_application_2/screen/create_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ReadPage extends StatefulWidget {
  ReadPage({super.key, required this.box});
  Box<User> box;
  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreatePage(box: widget.box),
                ));
          }),
      appBar: AppBar(
        title: const Text("Todo-List"),
        centerTitle: true,
      ),
      body: signal(context),
    );
  }

  Widget noSignal(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "NO DATA",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }

  Widget signal(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.box.listenable(),
      builder: (context, value, child) {
        if (value.isEmpty) {
          return noSignal(context);
        } else {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue[100],
                    child: Text(
                        '${value.get(widget.box.keys.toList()[index])!.age}'),
                  ),
                  title: Text(value.get(widget.box.keys.toList()[index])!.name),
                  subtitle:
                      Text(value.get(widget.box.keys.toList()[index])!.nation),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          value.delete(widget.box.keys.toList()[index]);
                        });
                      },
                      icon: const Icon(Icons.delete)),
                ),
              );
            },
          );
        }
      },
    );
  }
}
