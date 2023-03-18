import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pnemonia/progress.dart';
import 'package:pnemonia/result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? imageFile;

  void _getFromCamera() async {
    XFile? picked = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxHeight: 500, maxWidth: 500);

    setState(() {
      imageFile = File(picked!.path);
    });

    imageFile != null
        ? Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Result(
                      imageFile: imageFile,
                    )))
        : null;
  }

  void _getFromGallary() async {
    XFile? picked = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);

    setState(() {
      imageFile = File(picked!.path);
    });

    imageFile != null
        ? Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Progress(
                      imageFile: imageFile,
                    )))
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Pneumonia prediction"),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/radiograph.png',
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type spec"),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  MaterialButton(
                    onPressed: () {
                      _getFromCamera();
                    },
                    color: Colors.greenAccent,
                    child: const Text("Open camera"),
                  ),
                  const Expanded(child: Text("")),
                  MaterialButton(
                    onPressed: () {
                      _getFromGallary();
                    },
                    color: Colors.amber,
                    child: const Text("Upload"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
