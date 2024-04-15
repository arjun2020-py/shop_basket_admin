import 'package:flutter/material.dart';

import '../../../../utils/custom_color.dart';
import '../../../../utils/custom_widget/custom_arrow_back.dart';



class MyTabBar extends StatefulWidget {
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Number of tabs
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: userAppMainColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: transprentColor,
        leading: CustomArrowBack(),
        title: Text('My Order'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Actvie'),
            Tab(text: 'Completed'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('In Progress')),
          Center(child: Text('Deliverd')),
          Center(child: Text('Cancelled')),
        ],
      ),
    );
  }
}
