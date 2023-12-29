import 'package:flutter/material.dart';

class UnLockPage extends StatefulWidget {
  const UnLockPage({super.key});

  @override
  State<UnLockPage> createState() => _UnLockPageState();
}

class _UnLockPageState extends State<UnLockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Unlock Page"),
      ),
    );
  }
}
