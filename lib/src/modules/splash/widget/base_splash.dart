import 'package:chatdemoapp/src/common/constant/images_assets.dart';
import 'package:chatdemoapp/src/utils/helpers/size_config.dart';
import 'package:chatdemoapp/src/widgets/size/height_width.dart';
import 'package:chatdemoapp/src/widgets/texts/normal_widget.dart';
import 'package:flutter/material.dart';

class BaseSplash extends StatelessWidget {
  const BaseSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(ImageAsset.logo, height: height(130), width: width(120)),
          const Spacer(),
          Image.asset(ImageAsset.loadingAnimationGif,
              height: height(30), width: width(20)),
          const NormalText(
            "Loading...",
          ),
          const HeightWidget(.10),
        ],
      ),
    );
  }
}
