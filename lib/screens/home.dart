import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CameraController controller;
  CameraImage? _cameraImage;
  String output = "";

  loadModel() async {
    try {
      await Tflite.loadModel(model: "assets/model.tflite", labels: "assets/labels.txt");
    } catch (e) {}
  }

  loadCamera() {
    controller = CameraController(cameras![0], ResolutionPreset.medium);
    controller.initialize().then((value) {
      if (!mounted) return;
      setState(() {
        controller.startImageStream((imageStream) {
          _cameraImage = imageStream;
          runModel();
        });
      });
    });
  }

  runModel() async {
    if (_cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
        bytesList: _cameraImage!.planes.map((e) => e.bytes).toList(),
        imageHeight: _cameraImage!.height,
        imageWidth: _cameraImage!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 2,
        threshold: 0.1,
        asynch: true,
      );
      for (var element in predictions!) {
        setState(() {
          output = element['label'];
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ML"),
      ),
      body: Center(
          child: controller.value.isInitialized
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: CameraPreview(controller),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Prediction:   "),
                        Text(
                          output.substring(output.length - 1),
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                )
              : const Text("Camera controller not initialized")),
    );
  }
}
