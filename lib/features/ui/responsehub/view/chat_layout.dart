import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih_2023/features/constants/constants.dart';
import 'package:sih_2023/features/functions/get_logo_text.dart';
import 'package:sih_2023/features/ui/chat/view/chat.dart';
import 'package:sih_2023/features/ui/responsehub/view/show_quick_actions.dart';

class TemprorayEmergencyRoomWidget extends StatefulWidget {
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
  State<TemprorayEmergencyRoomWidget> createState() =>
      _TemprorayEmergencyRoomWidgetState();
}

class _TemprorayEmergencyRoomWidgetState
    extends State<TemprorayEmergencyRoomWidget> {
  String buttonText = "InProgress";
  Color containerColor = Colors.red;
  bool isButtonVisible = true;

  void _authorize() {
    setState(() {
      buttonText = "Authorized";
      containerColor = Colors.green;
      isButtonVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(5),
        leading: GestureDetector(
          onTap: () {
            showQuickActions(context, widget.integratedReliefRoomName,
                widget.integratedroomId, widget.integratedlatLng, widget.radius);
          },
          child: CircleAvatar(
            radius: 30,
            child: Text(getLogoText(widget.integratedReliefRoomName)),
          ),
        ),
        title: Text(
          widget.integratedReliefRoomName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Created on ${widget.integratedCreatedOn.substring(8, 10)}th ${monthMap[widget.integratedCreatedOn.substring(5, 7)]} ${widget.integratedCreatedOn.substring(0, 4)}",
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  height: 20,
                  width: 75,
                  child: Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Visibility(
                    visible: isButtonVisible,
                    child: TextButton(
                        onPressed: _authorize, child: Text("Authorize")))
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_outward),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                roomName: widget.integratedReliefRoomName,
                roomId: widget.integratedroomId,
              ),
            ),
          );
        },
      ),
    );
  }
}
