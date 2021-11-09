import 'package:chatdemoapp/src/common/constant/constants.dart';
import 'package:chatdemoapp/src/core/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({Key? key, this.color}) : super(key: key);
  final Colors? color;

  @override
  _BottomNavWidgetState createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
        canvasColor:
            widget.color == null ? kWhiteColor.withOpacity(.20) : kWhiteColor,
        // // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        // primaryColor: Colors.red,
        // textTheme: Theme.of(context).textTheme.copyWith(
        //       caption: new TextStyle(color: Colors.yellow),
        //     ),
      ),
      child: Obx(
        () => BottomNavigationBar(
          onTap: (newIndex) => homeController.index.value = newIndex,
          currentIndex: homeController.index.value,
          elevation: 0,
          items: [
            bottomNavigation(
                homeController.index.value, 0, FontAwesomeIcons.calendarAlt),
            bottomNavigation(
                homeController.index.value, 1, FontAwesomeIcons.calendar),
            bottomNavigation(
                homeController.index.value, 2, FontAwesomeIcons.home),
            bottomNavigation(
                homeController.index.value, 3, FontAwesomeIcons.userGraduate),
            bottomNavigation(
                homeController.index.value, 4, FontAwesomeIcons.commentDots),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigation(
      int selectedIndex, index, IconData iconData) {
    return BottomNavigationBarItem(
        icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == selectedIndex
                  ? kPrimaryColor
                  : widget.color == null
                      ? kWhiteColor.withOpacity(.20)
                      : kWhiteColor,
            ),
            child: FaIcon(iconData,
                color: index == selectedIndex ? kWhiteColor : kPrimaryColor)),
        label: '');
  }
}
