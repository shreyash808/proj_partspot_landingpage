import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:partyspot/module/explore/controller/explore_controller.dart';
import 'package:partyspot/module/explore/view/widgets/explore_appbar.dart';
import 'package:partyspot/module/explore/view/widgets/filter_event_dialog.dart';
import 'package:partyspot/module/home/presentation/view/widgets/popular_events_list.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});
  final TextEditingController textController = TextEditingController();
  final ExploreController controller = Get.put(ExploreController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColor.whiteColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: CustomExploreAppBar(
          textController: textController,
          onFilterTap: () => _showFilterDialog(context),
          onNotificationTap: () {
            print("Notification icon tapped");
          },
          onSearchChanged: (value) {
            print("Search text: $value");
          },
        ),

        body: SingleChildScrollView(child: PopularEventsList()),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return FilterDialogWidget();
      },
    );
  }
}
