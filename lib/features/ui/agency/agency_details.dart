import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/agency/agency_associates.dart';
import 'package:sih_2023/features/ui/agency/agency_description.dart';
import 'package:sih_2023/features/ui/agency/agency_image.dart';

class AgencyDetailsScreen extends StatelessWidget {
  const AgencyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agency Details"),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AgencyImageHolder(),
              AgencyDescription(),
              AgencyAssociates(),
            ],
          ),
        ),
      ),
    );
  }
}
