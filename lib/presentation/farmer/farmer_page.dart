import 'package:flutter/material.dart';

class FarmerPage extends StatelessWidget{
  const FarmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Farmer Page"),
      ),
      body: Center(
        child: Text("This is the farmers page"),
      ),
    );
  }
}