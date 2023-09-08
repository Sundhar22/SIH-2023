import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sih_2023/features/ui/search/controller/query_controller.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<QueryController>(builder: (getxController) {
      return SizedBox(
        height: 50,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 18),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: getxController.searchQuery.value),
                  autofocus: true,
                  onChanged: (value) => getxController.updateQuery(value),
                ),
              ),
            ),
          ],
        ),
        // color: Colors.grey,
      );
    });
  }
}
