import 'package:flutter/material.dart';

class FinishBookPage extends StatelessWidget {
  FinishBookPage({super.key});
  int rating = 0;
  String feedback = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Congratulations"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
