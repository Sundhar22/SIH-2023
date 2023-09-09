import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2023/features/ui/search/controller/query_controller.dart';
import 'package:sih_2023/features/ui/search/view/query_results.dart';
import 'package:sih_2023/features/ui/search/view/search_box.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    Get.put(QueryController());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchBox(),
            QueryResults(),
          ],
        ),
      ),
    );
  }
}
