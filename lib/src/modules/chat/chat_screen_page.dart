import 'package:chatdemoapp/src/common/constant/constants.dart';
import 'package:chatdemoapp/src/common/constant/images_assets.dart';
import 'package:chatdemoapp/src/core/controllers/home_page_controller.dart';
import 'package:chatdemoapp/src/data/model/message_model.dart';
import 'package:chatdemoapp/src/data/model/user_model.dart';
import 'package:chatdemoapp/src/modules/chat/widgets/chat_bottom_navigation_bar.dart';
import 'package:chatdemoapp/src/utils/helpers/size_config.dart';
import 'package:chatdemoapp/src/widgets/buttons/custom_elevated_button.dart';
import 'package:chatdemoapp/src/widgets/custompaint/custom_clipper_bottom_navigator.dart';
import 'package:chatdemoapp/src/widgets/input_fields/input_field.dart';
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
              height: height(120),
              decoration: BoxDecoration(
                color: kWhiteColor,
                border: Border.all(color: kBlackColor, width: 5),
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
                      icon: const FaIcon(FontAwesomeIcons.arrowCircleLeft)),
                  const Spacer(
                    flex: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NormalText(args.name),
                  ),
                  const Spacer(
                    flex: 4,
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
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
                  Container(
                    height: height(250),
                    margin:
                        const EdgeInsets.symmetric(horizontal: kDefaultmargin),
                    padding: const EdgeInsets.only(
                      top: kDefaultmargin / 4,
                      left: kDefaultmargin / 2,
                      right: kDefaultmargin / 2,
                    ),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(kDefaultmargin),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.search)),
                              Expanded(
                                child: InputField(
                                  controller:
                                      homeController.chatInputController,
                                  maxline: 10,
                                  hintText: 'Écrire',
                                ),
                              ),
                              IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.mic))
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: const FaIcon(FontAwesomeIcons.bold)),
                                const WidthWidget(.02),
                                InkWell(
                                    onTap: () {},
                                    child:
                                        const FaIcon(FontAwesomeIcons.italic)),
                                const WidthWidget(.02),
                                InkWell(
                                    onTap: () {},
                                    child: const FaIcon(
                                        FontAwesomeIcons.strikethrough)),
                                const WidthWidget(.02),
                                InkWell(
                                    onTap: () {},
                                    child: const FaIcon(
                                        FontAwesomeIcons.paperclip)),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: const FaIcon(FontAwesomeIcons.link)),
                                const WidthWidget(.02),
                                InkWell(
                                    onTap: () {},
                                    child:
                                        const FaIcon(FontAwesomeIcons.smile)),
                                const WidthWidget(.02),
                                SizedBox(
                                  width: width(100),
                                  child: CustomElevatedButton(
                                      backgroundColor: kChatButtonColor,
                                      label: 'Envoyer',
                                      onPressed: () {
                                        homeController.submitdata(args);
                                      }),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const BottomChatNavWidget(),
          ],
        ),
        //bottomNavigationBar: const BottomChatNavWidget(),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final UserModel args;

  const MessageWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: args.message!.length,
        separatorBuilder: (context, index) {
          MessageModel msg = args.message![index];
          return Stack(
            children: [
              Divider(),
              Center(
                child: NormalText(
                  " Mardi 17 août à 22h ",
                  color: kGreyColor,
                  fontSize: 12,
                ),
              )
            ],
          );
        },
        itemBuilder: (context, index) {
          MessageModel msg = args.message![index];
          return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                WidthWidget(.01),
                CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(ImageAsset.profile)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidthWidget(.02),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding / 2),
                          child: NormalText(
                            args.name,
                            fontSize: 12,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(kDefaultPadding / 2),
                            margin: EdgeInsets.all(kDefaultPadding / 2),
                            decoration: const BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Text(msg.message)),
                      ],
                    ),
                  ),
                ),
              ]);
        });
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [CircularProgressIndicator(), NormalText("loading")],
    );
  }
}
