import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/views/screens/team/info_widget.dart';
import 'package:football_score/views/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../../../utils/app_theme.dart';

class TeamDetailScreen extends StatefulWidget {
  const TeamDetailScreen({super.key});

  @override
  State<TeamDetailScreen> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends State<TeamDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const CustomText(text: '', textColor: Colors.white, size: 20),
      ),
      body: Column(
        children: [
          Container(
            height: 40.h,
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(
                25.r,
              ),
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              onTap: (value) {
                // if (value == 0 || value == 2) {
                //   matchDetailController.getOverview();
                // } else if (value == 1) {
                //   matchDetailController.getLineUp();
                // } else {
                //   matchDetailController.getPreview();
                // }
              },
              padding: EdgeInsets.all(5.w),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.r,
                ),
                color: secondaryColor,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              dividerColor: Colors.transparent,
              tabs: [
                Tab(
                  text: 'fixtures'.tr,
                ),
                Tab(
                  text: 'stats'.tr,
                ),
                Tab(
                  text: 'player'.tr,
                ),
                Tab(
                  text: 'info'.tr,
                ),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(controller: tabController, children: [
            Center(
              child: CustomText(text: 'Fixture'),
            ),
            Center(
              child: CustomText(text: 'Fixture'),
            ),
            Center(
              child: CustomText(text: 'Fixture'),
            ),
            InfoWidget()
          ]))
        ],
      ),
    );
  }
}
