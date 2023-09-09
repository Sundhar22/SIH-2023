import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AgencyImageHolder extends StatelessWidget {
  const AgencyImageHolder({
    super.key,
    required this.imageLink,
  });

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Container(
        height: 250,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          image: DecorationImage(
            fit: BoxFit.contain,
            image: CachedNetworkImageProvider(
              imageLink,
            ),
          ),
        ),
      ),
    );
  }
}
