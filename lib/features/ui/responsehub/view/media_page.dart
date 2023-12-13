import 'package:flutter/material.dart';

class MediaPage extends StatefulWidget {
  final String roomName;

  const MediaPage({super.key, required this.roomName});

  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Medias'),
            Tab(text: 'Docs'),
            Tab(text: 'Links'),
          ],
          indicatorColor: Colors.blueAccent,
          labelColor: Colors.blueAccent,
          unselectedLabelColor: Colors.black,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
           Center(child: Text('Medias')),
           Center(child: Text('Docs')),
           Center(child: Text('Links')),
        ],
      ),
    );
  }
}
