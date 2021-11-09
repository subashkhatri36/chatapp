import 'package:chatdemoapp/src/common/constant/constants.dart';
import 'package:chatdemoapp/src/core/controllers/home_page_controller.dart';
import 'package:chatdemoapp/src/modules/chat/widgets/chat_bottom_navigation_bar.dart';
import 'package:chatdemoapp/src/modules/home/widgets/home_dashboard_widget.dart';
import 'package:chatdemoapp/src/utils/helpers/size_config.dart';
import 'package:chatdemoapp/src/widgets/bottom_nav_widget.dart';
import 'package:chatdemoapp/src/widgets/custompaint/custom_clipper_bottom_navigator.dart';
import 'package:chatdemoapp/src/widgets/texts/app_bar_text.dart';
import 'package:chatdemoapp/src/widgets/texts/normal_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    homeController.loadOfflineDatabase();
    return DefaultTabController(
      length: homeController.tabController.length,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          elevation: 0,
          title: const AppBarText("Mon espace coach"),
          centerTitle: true,
          bottom: TabBar(
            controller: homeController.tabController,
            indicatorSize: TabBarIndicatorSize.label,
            onTap: (index) {
              // Tab index when user select it, it start from zero
            },
            tabs: const [
              Tab(
                child: NormalText("COACH"),
              ),
              Tab(
                child: NormalText("RENCONTRES"),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const Divider(
              color: kBlackColor,
            ),
            Expanded(
              child: TabBarView(
                  controller: homeController.tabController,
                  children: const [
                    HomeDashBoardWidget(),
                    HomeDashBoardWidget(),
                  ]),
            ),
            BottomChatNavWidget(),
          ],
        ),
        //bottomNavigationBar: BottomNavWidget(),
      ),
    );
  }
}
