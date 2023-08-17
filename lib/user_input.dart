import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  const UserInput({super.key});

  @override
  State<UserInput> createState() {
    return _UserInputState();
  }
}

class _UserInputState extends State<UserInput> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(23)))),
    );
  }
}
