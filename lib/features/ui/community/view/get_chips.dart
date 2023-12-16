import 'package:flutter/material.dart';

final List<IconData> chipIcons = [
  Icons.image,
  Icons.group_sharp,
  Icons.video_call,
  Icons.help,
];

final List<String> chipTitles = [
  "Photos",
  "Friends",
  "Posts",
  "Complaints",
];

final List<Color> chipBgColor = [
  const Color.fromRGBO(239, 252, 238, 1),
  const Color.fromRGBO(230, 237, 254, 1),
  const Color.fromRGBO(251, 237, 233, 1),
  const Color.fromARGB(255, 249, 251, 233),
];

final List<Color> chipIconColor = [
  Colors.green,
  Colors.blue,
  Colors.red,
  Colors.amber,
];

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.chipTitle,
    required this.bgColor,
    required this.iconColor,
    required this.chipIcon,
  });

  final String chipTitle;
  final Color bgColor, iconColor;
  final IconData chipIcon;

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Chip(
        label: Text(chipTitle),
        avatar: Icon(
          chipIcon,
          color: iconColor,
        ),
        backgroundColor: bgColor,
      ),
    );
  }
}

List<Widget> getChips() {
  final List<Widget> customChips = [];
  for (int i = 0; i < chipTitles.length; i++) {
    customChips.add(
      CustomChip(
        chipTitle: chipTitles[i],
        bgColor: chipBgColor[i],
        iconColor: chipIconColor[i],
        chipIcon: chipIcons[i],
      ),
    );
  }
  return customChips;
}
