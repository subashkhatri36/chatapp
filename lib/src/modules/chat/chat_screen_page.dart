import 'package:chatdemoapp/src/common/constant/constants.dart';
import 'package:chatdemoapp/src/core/controllers/home_page_controller.dart';
import 'package:chatdemoapp/src/data/model/user_model.dart';
import 'package:chatdemoapp/src/modules/chat/widgets/chat_bottom_navigation_bar.dart';
import 'package:chatdemoapp/src/modules/chat/widgets/message_list_widget.dart';
import 'package:chatdemoapp/src/utils/helpers/size_config.dart';
import 'package:chatdemoapp/src/widgets/size/height_width.dart';
import 'package:chatdemoapp/src/widgets/texts/normal_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class ChatPage extends StatelessWidget {
  final UserModel args = Get.arguments;
  ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        homeController.isChatPage.value = false;
        return true;
      },
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: height(110),
              decoration: BoxDecoration(
                color: kWhiteColor,
                border: Border.all(color: kPrimaryColor, width: 1),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                        homeController.isChatPage.value = false;
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.arrowCircleLeft,
                        color: kPrimaryColor,
                      )),
                  const Spacer(
                    flex: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NormalText(
                      args.name,
                      color: kPrimaryColor,
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  )
                ],
              ),
            ),
            Expanded(
                child: Obx(() => homeController.isloadingUserData.value
                    ? args.message != null && args.message!.isEmpty
                        ? const Center(
                            child: NormalText("No Message"),
                          )
                        : MessageWidget(args: args)
                    : args.message != null && args.message!.isEmpty
                        ? const Center(
                            child: NormalText("No Message"),
                          )
                        : MessageWidget(args: args))),
            const BottomChatNavWidget(),
          ],
        ),

        //bottomNavigationBar: const BottomChatNavWidget(),
      ),
    );
  }
}

class CustomInputButtonWidget extends StatelessWidget {
  final Color? color;
  final IconData icon;
  final double? size;
  const CustomInputButtonWidget(
      {Key? key, this.color, this.size, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: FaIcon(
          icon,
          color: color ?? kPrimaryColor,
          size: size ?? 24,
        ));
  }
}
