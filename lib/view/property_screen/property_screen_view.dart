import 'package:flutter/material.dart';

class PropertyScreenView extends StatelessWidget {
  const PropertyScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Property Screen"),
      ),
      body: const Center(
        child: Text("Property Screen"),
      ),
    );
  }
}
