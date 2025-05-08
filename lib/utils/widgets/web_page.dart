import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';

import '../constants/color_consts.dart';
import '../constants/string_consts.dart';
import 'custom_app_bar.dart';

class WebPage extends StatefulWidget {
  final String title;
  final String url;

  const WebPage({super.key, required this.title, required this.url});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  //late WebViewController webViewController;

  @override
  void initState() {
    super.initState();

    //webViewController = WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted);
    //webViewController.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasArrow: true,
        title: widget.title.tr,
        titleColor: AppColor.darkPrimaryColor,
      ),
      body: Container(
        height: AppSizes.height,
        width: AppSizes.width,
        padding: EdgeInsets.symmetric(horizontal: 20.spW),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Expanded(child: WebViewWidget(controller: webViewController)),
              Text(
                StringConsts.loremIpsum,
                style: AppTextStyles.get18MediumTextStyle(color: AppColor.darkPrimaryColor),
              ),
              AppSizes.heightBox(boxHeight: 20),
              Text(
                StringConsts.loreIpsumDesc,
                style: AppTextStyles.get16RegularTextStyle(color: AppColor.lightTextColor),
              ),
              AppSizes.heightBox(boxHeight: 20),
              Text(
                StringConsts.loremIpsum,
                style: AppTextStyles.get18MediumTextStyle(color: AppColor.darkPrimaryColor),
              ),
              AppSizes.heightBox(boxHeight: 20),
              Text(
                StringConsts.loreIpsumDesc,
                style: AppTextStyles.get16RegularTextStyle(color: AppColor.lightTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
