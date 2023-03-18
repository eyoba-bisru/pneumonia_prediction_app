import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pnemonia/home_screen.dart';
import 'package:pnemonia/result.dart';

class Progress extends StatelessWidget {
  final File? imageFile;
  const Progress({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(padding: const EdgeInsets.all(25), children: [
          Image.file(imageFile!),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                color: Colors.red,
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Expanded(child: Text("")),
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Result(imageFile: imageFile)));
                },
                color: Colors.green,
                child: const Text(
                  "Proceed",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
