import 'package:bitstone/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Markets"),
      ),
      body: Center(
        child: Container(
          child: const Text("Welcome to BitStone"),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
