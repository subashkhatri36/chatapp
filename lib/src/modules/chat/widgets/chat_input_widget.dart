import 'package:chatdemoapp/src/common/constant/constants.dart';
import 'package:chatdemoapp/src/core/controllers/home_page_controller.dart';
import 'package:chatdemoapp/src/data/model/user_model.dart';
import 'package:chatdemoapp/src/utils/helpers/size_config.dart';
import 'package:chatdemoapp/src/widgets/buttons/custom_elevated_button.dart';
import 'package:chatdemoapp/src/widgets/input_fields/input_field.dart';
import 'package:chatdemoapp/src/widgets/size/height_width.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputTextAreaWidget extends StatelessWidget {
  const InputTextAreaWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  final UserModel args;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(218),
      margin: const EdgeInsets.symmetric(
          horizontal: kDefaultmargin, vertical: kDefaultPadding / 2),
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
                    icon: const Icon(
                      Icons.search,
                      color: kPrimaryColor,
                      size: 17,
                    )),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: kDefaultPadding / 4),
                    child: InputField(
                      controller: homeController.chatInputController,
                      maxline: 6,
                      hintText: 'Écrire',
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.mic,
                      color: kPrimaryColor,
                      size: 17,
                    ))
              ],
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.bold,
                        color: kInputOptionButtonColor,
                        size: 18,
                      )),
                  const WidthWidget(.02),
                  InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.italic,
                        color: kInputOptionButtonColor,
                        size: 18,
                      )),
                  const WidthWidget(.02),
                  InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.strikethrough,
                        color: kInputOptionButtonColor,
                        size: 18,
                      )),
                  const WidthWidget(.02),
                  InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.paperclip,
                        color: kInputOptionButtonColor,
                        size: 18,
                      )),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.link,
                        color: kInputOptionButtonColor,
                        size: 18,
                      )),
                  const WidthWidget(.02),
                  InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.smile,
                        color: kInputOptionButtonColor,
                        size: 18,
                      )),
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
    );
  }
}
