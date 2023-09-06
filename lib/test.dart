import 'package:flutter/material.dart';

class Testwidget extends StatefulWidget {
  const Testwidget({super.key});

  @override
  State<Testwidget> createState() => _TestwidgetState();
}

class _TestwidgetState extends State<Testwidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          margin: const EdgeInsets.all(10),
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text(index.toString()),
            );
          })),
    );
  }
}
