import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.imageLink});

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Image View"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: .1,
                  blurRadius: .1,
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height / 1.5,
            child: CachedNetworkImage(
              imageUrl: imageLink,
            ),
          ),
        ),
      ),
    );
  }
}
