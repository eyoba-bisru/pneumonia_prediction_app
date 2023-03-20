import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Prediction extends StatefulWidget {
  const Prediction({super.key});

  @override
  State<Prediction> createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  // ignore: prefer_typing_uninitialized_variables
  var _output;
  // ignore: prefer_typing_uninitialized_variables
  var _image;

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  void _getFromGallary() async {
    XFile? picked = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);

    setState(() {
      _image = File(picked!.path);
    });

    classifyImage(_image);
  }

  void _getFromCamera() async {
    XFile? picked = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxHeight: 500, maxWidth: 500);

    setState(() {
      _image = File(picked!.path);
    });

    classifyImage(_image);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: _image.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _output = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Prediction"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: ListView(children: [
            if (_image != null)
              Image.file(_image)
            else
              Container(
                height: 300,
                color: Colors.black26,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "You can upload image from gallary \n\nOR \n\nTake a photo using camera",
                      style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: _output != null
                  ? Text(
                      "Prediction: ${_output[0]['label'].toString().substring(2)}",
                      style: TextStyle(
                        color: _output != null
                            ? _output[0]['label'].toString().substring(2) ==
                                    'Normal'
                                ? Colors.green
                                : Colors.red
                            : Colors.black,
                        fontSize: 24,
                      ))
                  : Container(),
            ),
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
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/', (Route<dynamic> route) => false);
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
