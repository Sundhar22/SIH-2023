import 'package:flutter/material.dart';

class AgencyDescription extends StatelessWidget {
  const AgencyDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: ExpansionTile(
        initiallyExpanded: false,
        childrenPadding: EdgeInsets.all(10),
        title: Text("Agency Description"),
        children: [
          Text(
            "ENter your number bdebw ew e dewe dew e  e ed wed e edw ",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
