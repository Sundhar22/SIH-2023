import 'package:flutter/material.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/functions/get_logo_text.dart';
import 'package:sih_2023/features/ui/chat/view/chat.dart';
import 'package:sih_2023/features/ui/responsehub/view/show_quick_actions.dart';

class TemprorayEmergencyRoomWidget extends StatelessWidget {
  const TemprorayEmergencyRoomWidget({
    super.key,
    required this.integratedReliefRoomName,
    required this.integratedReliefRoomCause,
    required this.integratedReliefLocation,
    required this.integratedReliefRoomAgencies,
    required this.integratedCreatedOn,
    required this.integratedroomId,
    required this.integratedlatLng,
    required this.radius,
  });

  final String integratedReliefRoomName;
  final String integratedReliefRoomCause;
  final String integratedReliefLocation;
  final List<dynamic> integratedReliefRoomAgencies;
  final String integratedCreatedOn;
  final String integratedroomId;
  final List integratedlatLng;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(5),
        leading: GestureDetector(
          onTap: () {
            showQuickActions(
                context, integratedReliefRoomName, integratedroomId);
          },
          child: CircleAvatar(
            radius: 30,
            child: Text(getLogoText(integratedReliefRoomName)),
          ),
        ),
        title: Text(
          integratedReliefRoomName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Created on ${integratedCreatedOn.substring(8, 10)}th ${monthMap[integratedCreatedOn.substring(5, 7)]} ${integratedCreatedOn.substring(0, 4)}",
        ),
        trailing: const Icon(Icons.arrow_outward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                roomName: integratedReliefRoomName,
                roomId: integratedroomId,
              ),
            ),
          );
        },
      ),
    );
  }
}
