import 'package:flutter/material.dart';
import 'package:sih_2023/features/ui/community/alert_notifications.dart';
import 'package:sih_2023/features/ui/community/view/comm_posts.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({super.key});

  @override
  State createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Set the number of tabs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text('Social Connect'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Alerts & Notification'),
            Tab(text: 'Community Posts'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AlertNotification(),
          CommunityPostScreen(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
