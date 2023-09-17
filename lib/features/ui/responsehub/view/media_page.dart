import 'package:flutter/material.dart';

class MediaPage extends StatefulWidget {
  final String roomName;

   MediaPage({required this.roomName});

  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(widget.roomName),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTabOption(0, 'Medias'),
              _buildTabOption(1, 'Docs'),
              _buildTabOption(2, 'Links'),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          if (_selectedOption == 0)
            const Center(child: Text('Medias')),
          if (_selectedOption == 1)
            const Center(child: Text('Docs')),
          if (_selectedOption == 2)
            const Center(child: Text('Links')),
        ],
      ),
    );
  }

  Widget _buildTabOption(int index, String title) {
    final isSelected = index == _selectedOption;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: isSelected
            ? const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 5, color: Colors.blueAccent),
                ),
              )
            : null,
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.blueAccent : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
