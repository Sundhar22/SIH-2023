import 'package:flutter/material.dart';

class DropdownTabBarDemo extends StatefulWidget {
  @override
  _DropdownTabBarDemoState createState() => _DropdownTabBarDemoState();
}

class _DropdownTabBarDemoState extends State<DropdownTabBarDemo> with TickerProviderStateMixin {
  // Define variables for managing the selected dropdown value and active tab index.
  String selectedDropdownValue = 'Tab 1';
  int activeTabIndex = 0;

  // Define the list of tab titles and their respective content.
  final List<String> tabTitles = ['Tab 1', 'Tab 2', 'Tab 3'];
  
  // Define the content for each tab.
  final List<Widget> tabContent = [
    // Replace these with your tab content widgets.
    Text('Tab 1 Content'),
    Text('Tab 2 Content'),
    Text('Tab 3 Content'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown TabBar Demo'),
      ),
      body: Column(
        children: [
          // Dropdown Button
          DropdownButton<String>(
            value: selectedDropdownValue,
            onChanged: (newValue) {
              setState(() {
                selectedDropdownValue = newValue!;
                activeTabIndex = tabTitles.indexOf(newValue);
              });
            },
            items: tabTitles.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          
          // Tab Bar
          TabBar(
            tabs: tabTitles.map((String title) {
              return Tab(text: title);
            }).toList(),
            controller: TabController(
              length: tabTitles.length,
              initialIndex: activeTabIndex,
              vsync: this,
            ),
            onTap: (index) {
              setState(() {
                activeTabIndex = index;
                selectedDropdownValue = tabTitles[index];
              });
            },
          ),

          // Tab Bar View
          Expanded(
            child: TabBarView(
              controller: TabController(
                length: tabTitles.length,
                initialIndex: activeTabIndex,
                vsync: this,
              ),
              children: tabContent,
            ),
          ),
        ],
      ),
    );
  }
}
