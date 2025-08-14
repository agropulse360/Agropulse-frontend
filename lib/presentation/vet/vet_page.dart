import 'package:flutter/material.dart';

class VetPage extends StatelessWidget{
  const VetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vet Page"),
      ),
      body: Center(
        child: Text("This is the vet's page"),
      ),
    );
  }
}