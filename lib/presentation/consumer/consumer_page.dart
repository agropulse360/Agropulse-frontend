import 'package:flutter/material.dart';

class ConsumerPage extends StatelessWidget{
  const ConsumerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumer Page"),
      ),
      body: Center(
        child: Text("This is the consumer's page"),
      ),
    );
  }
}