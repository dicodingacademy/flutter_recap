import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unknown Page"),
      ),
      body: const Center(
        child: Text("Please check the route and argument properly."),
      ),
    );
  }
}