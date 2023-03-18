import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pnemonia/home_screen.dart';

class Result extends StatelessWidget {
  final File? imageFile;

  const Result({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: ListView(children: [
            Image.file(imageFile!),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text("Result: Positive",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              color: Colors.deepPurple,
              child: const Text(
                "Back to home",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ]),
        ),
      ),
    );
  }
}
