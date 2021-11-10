import 'package:chatdemoapp/src/common/constant/constants.dart';
import 'package:chatdemoapp/src/core/controllers/home_page_controller.dart';
import 'package:chatdemoapp/src/data/model/user_model.dart';
import 'package:chatdemoapp/src/modules/chat/chat_screen_page.dart';
import 'package:chatdemoapp/src/utils/helpers/date_utils.dart';
import 'package:chatdemoapp/src/widgets/input_fields/input_field.dart';
import 'package:chatdemoapp/src/widgets/size/height_width.dart';
import 'package:chatdemoapp/src/widgets/texts/normal_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDashBoardWidget extends StatefulWidget {
  const HomeDashBoardWidget({Key? key}) : super(key: key);

  @override
  State<HomeDashBoardWidget> createState() => _HomeDashBoardWidgetState();
}

class _HomeDashBoardWidgetState extends State<HomeDashBoardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: kDefaultPadding / 2,
          left: kDefaultPadding / 2,
          right: kDefaultPadding / 2),
      child: Column(
        children: [
          InputField(
            controller: homeController.searchTextController,
            hintText: "Chercher un coachs",
            icon: const Icon(
              Icons.search,
              color: kPrimaryColor,
            ),
            suffix: const RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.tune,
                  color: kPrimaryColor,
                )),
            backgroundColor: kSearch,
          ),
          Expanded(
            child: Obx(
              () => !homeController.isloadingUserData.value
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          HeightWidget(.02),
                          NormalText("Loading.."),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            // childAspectRatio: (2 / 1),
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 1,
                            padding: const EdgeInsets.all(5.0),
                            children: homeController.userMessageList
                                .asMap()
                                .entries
                                .map((d) {
                              UserModel data = d.value;
                              return InkWell(
                                  onTap: () {
                                    homeController.modelIndex = d.key;
                                    homeController.isChatPage.value = true;
                                    Get.to(() => ChatPage(),
                                        arguments: d.value);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                            radius: 38,
                                            backgroundImage:
                                                AssetImage(data.profile)),
                                        const HeightWidget(.01),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (data.onlineStatus)
                                              Container(
                                                width: 10,
                                                height: 10,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topRight,
                                                      end: Alignment.bottomLeft,
                                                      colors: [
                                                        kIndicatorColor3,
                                                        kIndicatorColor1
                                                      ],
                                                    )),
                                              ),
                                            const WidthWidget(.01),
                                            Flexible(
                                                child: NormalText(
                                              data.name,
                                              fontSize: 13,
                                            )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ));
                            }).toList(),
                          ),
                          const HeightWidget(.03),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                UserModel um =
                                    homeController.userModelList[index];
                                return ListTile(
                                  onTap: () {
                                    homeController.modelIndex = index;
                                    homeController.isChatPage.value = true;
                                    Get.to(() => ChatPage(), arguments: um);
                                  },
                                  leading: CircleAvatar(
                                    radius: 38,
                                    backgroundImage: AssetImage(um.profile),
                                  ),
                                  title: Row(
                                    children: [
                                      Expanded(
                                        child: NormalText(
                                          um.name,
                                          isBold: true,
                                        ),
                                      ),
                                      NormalText(
                                        formatDate(
                                          um.msgTime,
                                        ),
                                        color: kSubtitleColor,
                                        fontSize: 15,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: kGreyColor,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                  isThreeLine: true,
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const HeightWidget(.001),
                                      NormalText(
                                        um.lastmessage,
                                        color: kSubtitleColor,
                                        maxline: 2,
                                        fontSize: 15,
                                      ),
                                      const Divider(
                                        color: kLightGreyColor,
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: homeController.userModelList.length)
                        ],
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
