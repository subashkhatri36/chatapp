import 'package:chatdemoapp/src/common/constant/images_assets.dart';
import 'package:chatdemoapp/src/core/repositories/user_information_repo.dart';
import 'package:chatdemoapp/src/data/model/message_model.dart';
import 'package:chatdemoapp/src/data/model/reaction_model.dart';
import 'package:chatdemoapp/src/data/model/user_model.dart';
import 'package:chatdemoapp/src/utils/helpers/snackbar_helper.dart';
import 'package:chatdemoapp/src/utils/storage/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

final homeController = HomeController.instance;

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  static HomeController instance = Get.find();

  //Bottom navigation Bar index
  RxInt index = 2.obs;

//for search text
  TextEditingController searchTextController = TextEditingController();
  TextEditingController chatInputController = TextEditingController();

  //tab controller
  late TabController tabController;
  RxBool isChatPage = false.obs;
  int modelIndex = 0;

//list of user
  RxList<UserModel> userModelList = List<UserModel>.empty(growable: true).obs;
  RxList<UserModel> userMessageList = List<UserModel>.empty(growable: true).obs;

  List<UserModel> dummydata = [
    UserModel(
        id: 1,
        name: "Bessie Cooper",
        lastmessage: 'Salut, comment tu vas ? je vais avoir 5 min de retard',
        msgTime: DateTime.now(),
        onlineStatus: false,
        profile: ImageAsset.profile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 4,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 2,
            seen: true,
          ),
        ]),
    UserModel(
        id: 2,
        name: "Kevin Rosal",
        lastmessage: 'Super séance. félicitations !',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.profile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 4,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 1,
            seen: true,
          ),
        ]),
    UserModel(
        id: 3,
        name: "Jessica Walsh",
        lastmessage:
            'Cut chemist is doing an hour DJ set tomorrow nite on kcrw',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.profile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
    UserModel(
        id: 4,
        name: "Greg Adams",
        lastmessage: 'Famers market is at Pasadena Highschool Saturday morning',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.profile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
    UserModel(
        id: 5,
        name: "Bessie Cooper",
        lastmessage: 'Salut, comment tu vas ? je vais avoir 5 min de retard',
        msgTime: DateTime.now(),
        onlineStatus: false,
        profile: ImageAsset.profile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
    UserModel(
        id: 6,
        name: "Kevin Rosal",
        lastmessage: 'Super séance. félicitations !',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.profile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
    UserModel(
        id: 7,
        name: "Jessica Walsh",
        lastmessage:
            'Cut chemist is doing an hour DJ set tomorrow nite on kcrw',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.profile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
    UserModel(
        id: 8,
        name: "Greg Adams",
        lastmessage: 'Famers market is at Pasadena Highschool Saturday morning',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.profile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
    UserModel(
        id: 9,
        name: "Jessica Walsh",
        lastmessage:
            'Cut chemist is doing an hour DJ set tomorrow nite on kcrw',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.profile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
    UserModel(
        id: 10,
        name: "Kevin Rosal",
        lastmessage: 'Super séance. félicitations !',
        msgTime: DateTime.now(),
        onlineStatus: true,
        profile: ImageAsset.profile,
        message: [
          MessageModel(
            message: "Merci pour la séance",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message: "Salut, comment tu vas ? Je vais avoir 5 min de retard",
            id: 2,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
          MessageModel(
            message:
                "De rien, merci à toi. Très bonne fin de semaine et n’hésite pas à reprendre rendez-vous !",
            id: 1,
            deliver: true,
            reciverId: 6,
            reaction: null,
            messageTime: DateTime.now(),
            senderId: 3,
            seen: true,
          ),
        ]),
  ];

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: 2, vsync: this);
  }

  void submitdata(UserModel usermodel) {
    isloadingUserData.value = false;
    if (chatInputController.text.isNotEmpty) {
      MessageModel msg = MessageModel(
        message: chatInputController.text,
        id: usermodel.id,
        deliver: true,
        reciverId: 6,
        reaction: null,
        messageTime: DateTime.now(),
        senderId: usermodel.id,
        seen: true,
      );
      print(modelIndex);
      usermodel.lastmessage = chatInputController.text;
      usermodel.message!.add(msg);
      userModelList[modelIndex] = usermodel;
      userRepo.insertNewUser();
      chatInputController.text = "Écrire";
    } else {
      showSnackbar(title: 'Wraning !', message: 'No data to send');
    }
    isloadingUserData.value = true;
  }

  //get userDetails from database
  RxBool isloadingUserData = false.obs;
  loadOfflineDatabase() async {
    //print('starting fetching database');
    isloadingUserData.value = false;

    List<UserModel> user = [];
    user = await userRepo.getAllUser();

    if (user.isNotEmpty) {
      if (user.length > 9) {
        userModelList = user.obs;
      } else {
        userModelList = user.obs;
      }
      userMessageList = user.take(9).toList().obs;
    } else {
      if (userModelList.isEmpty) {
        userModelList = dummydata.obs;
        await userRepo.insertNewUser();
        //await shareprefrence.save("User", userModelList.toJson());
      }
    }
    isloadingUserData.value = true;
  }
}
