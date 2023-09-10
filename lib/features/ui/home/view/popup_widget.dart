import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/home/controller/filter_controller.dart';
import 'package:sih_2023/features/ui/home/view/drop_down.dart';

class PopupWidget extends StatelessWidget {
  const PopupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const SizedBox(
        child: Row(
          children: [
            Icon(Icons.gps_fixed, color: Colors.red),
            SizedBox(width: 10),
            Text("Hawk"),
          ],
        ),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.width / 1.5,
        width: MediaQuery.of(context).size.width,
        child: Scrollbar(
          thumbVisibility: true,
          child: GetX<FilterController>(
            builder: (getxController) {
              return ListView.builder(
                itemCount: getxController.filterOptions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: Text(
                        getxController.filterOptions[index],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      title: MyDropdown(
                        index: index,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
