import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BitStone"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to BitStone"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
