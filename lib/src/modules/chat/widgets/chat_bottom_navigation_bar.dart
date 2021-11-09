import 'package:chatdemoapp/src/common/constant/constants.dart';
import 'package:chatdemoapp/src/core/controllers/home_page_controller.dart';
import 'package:chatdemoapp/src/utils/helpers/size_config.dart';
import 'package:chatdemoapp/src/widgets/custompaint/custom_clipper_bottom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BottomChatNavWidget extends StatelessWidget {
  const BottomChatNavWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
        canvasColor: kWhiteColor,
      ),
      child: Column(
        children: [
          Container(
            color: kWhiteColor,
            width: double.infinity,
            height: height(40),
            child: Obx(
              () => ClipPath(
                clipper: ButtomNavClipper(),
                child: Container(
                  width: double.infinity,
                  height: height(40),
                  color: !homeController.isChatPage.value
                      ? kLightGreyColor.withOpacity(.30)
                      : kSecondaryColor,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => BottomNavigationBar(
                onTap: (newIndex) => homeController.index.value = newIndex,
                currentIndex: homeController.index.value,
                elevation: 0,
                items: [
                  bottomNavigationOne(homeController.index.value, 0,
                      FontAwesomeIcons.calendarAlt),
                  bottomNavigationOne(
                      homeController.index.value, 1, FontAwesomeIcons.calendar),
                  bottomNavigationOne(
                      homeController.index.value, 2, FontAwesomeIcons.home),
                  bottomNavigationOne(homeController.index.value, 3,
                      FontAwesomeIcons.userGraduate),
                  bottomNavigationOne(homeController.index.value, 4,
                      FontAwesomeIcons.commentDots),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationOne(
      int selectedIndex, index, IconData iconData) {
    return BottomNavigationBarItem(
        icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == selectedIndex ? kPrimaryColor : kWhiteColor,
            ),
            child: FaIcon(
              iconData,
              color: index == selectedIndex ? kWhiteColor : kPrimaryColor,
              size: index == selectedIndex ? 30 : 25,
            )),
        label: '');
  }
}
