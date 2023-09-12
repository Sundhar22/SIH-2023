import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:exif/exif.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
  });

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    getCamera();
  }

  Future<void> getCamera() async {
    await availableCameras();
    final cameras = await availableCameras();

    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );
    setState(() {
      _initializeControllerFuture = _controller.initialize();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Take a picture')),
      body: _initializeControllerFuture == null
          ? const Center(child: CircularProgressIndicator())
          : FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final image = await _controller.takePicture();

            if (!mounted) return;

            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  @override
  Widget build(BuildContext context) {
    String? locationInfo;

    Future<void> extractLocationFromImagePath(String imagePath) async {
      final File imageFile = File(imagePath);

      if (imageFile.existsSync()) {
        final Uint8List bytes = await imageFile.readAsBytes();
        final Map<String, IfdTag> tags = await readExifFromBytes(bytes);

        String? latitude;
        String? longitude;

        for (final tag in tags.values) {
          if (tag.tag == 'GPS GPSLatitude') {
            latitude = tag.toString();
          } else if (tag.tag == 'GPS GPSLongitude') {
            longitude = tag.toString();
          }
        }

        if (latitude != null && longitude != null) {
          setState(() {
            locationInfo = 'Latitude: $latitude\nLongitude: $longitude';
          });
        } else {
          setState(() {
            locationInfo = 'Location information not found in the image.';
          });
        }
      } else {
        setState(() {
          locationInfo = 'Image file not found.';
        });
      }
      print(locationInfo);
    }

    @override
    void initState() {
      super.initState();
      extractLocationFromImagePath(widget.imagePath);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Send Message')),
      body: Column(
        children: [
          Text(locationInfo ?? 'Loading...'),
          Align(
              alignment: Alignment.topCenter,
              child: Image.file(File(widget.imagePath))),
        ],
      ),
    );
  }
}
