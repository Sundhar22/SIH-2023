import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AgencyImageHolder extends StatelessWidget {
  const AgencyImageHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Container(
        height: 250,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              "https://ksdrf.karnataka.gov.in/uploads/91421667380455.jpg",
            ),
          ),
        ),
      ),
    );
  }
}
