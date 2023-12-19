import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/community/controller/alert_controller.dart';

class AlertNotification extends StatefulWidget {
  const AlertNotification({super.key});

  @override
  State<AlertNotification> createState() => _AlertNotificationState();
}

class _AlertNotificationState extends State<AlertNotification> {
  @override
  void initState() {
    super.initState();
    Get.put(AlertController());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<AlertController>(
        builder: (controller) {
          return controller.alertDatas.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.alertDatas.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.alternate_email),
                        ),
                        title: Text(
                          controller.alertDatas[index]["alertContent"],
                        ),
                        subtitle: Text(
                          controller.alertDatas[index]["alertSender"],
                        ),
                      ),
                    );
                  },
                )
              : const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "No Data Available",
                    ),
                  ],
                );
        },
      ),
    );
  }
}
